# API Integration Guide

## Overview

This document describes how to integrate external APIs with the Todo Flutter Hybrid application. The app uses a clean architecture pattern with offline-first capabilities.

---

## Base Configuration

### Environment Setup

1. **Create .env file**
   ```bash
   cp .env.example .env
   ```

2. **Configure API endpoint**
   ```env
   API_BASE_URL=https://your-api-url.com
   API_KEY=your_api_key_here
   ```

3. **Load in application**
   ```dart
   import 'package:flutter_dotenv/flutter_dotenv.dart';
   
   Future<void> main() async {
     await dotenv.load(fileName: ".env");
     runApp(const MyApp());
   }
   ```

---

## API Client Configuration

### Dio Client Setup

Location: `lib/core/network/dio_client.dart`

```dart
class DioClient {
  final Dio _dio;
  
  DioClient({required String baseUrl}) : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    // Add interceptors
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
    
    // Add auth interceptor
    _dio.interceptors.add(AuthInterceptor());
  }
}
```

### Authentication Interceptor

```dart
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from secure storage
    final token = await secureStorage.read(key: 'auth_token');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle token expiration
      // Navigate to login or refresh token
    }
    handler.next(err);
  }
}
```

---

## API Endpoints

### Authentication Endpoints

#### 1. Login
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "id": "123",
  "email": "user@example.com",
  "name": "John Doe",
  "token": "eyJhbGciOiJIUzI1...",
  "created_at": "2024-01-01T00:00:00Z"
}
```

**Implementation:**
```dart
// lib/features/auth/data/datasources/auth_remote_data_source.dart
@override
Future<UserModel> login({
  required String email,
  required String password,
}) async {
  final response = await client.post(
    '/auth/login',
    data: {
      'email': email,
      'password': password,
    },
  );
  
  if (response.statusCode == 200) {
    return UserModel.fromJson(response.data);
  } else {
    throw ServerException('Login failed');
  }
}
```

#### 2. Sign Up
```http
POST /auth/signup
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "name": "John Doe"
}
```

#### 3. Logout
```http
POST /auth/logout
Authorization: Bearer {token}
```

### Todo Endpoints

#### 1. Get All Todos
```http
GET /todos
Authorization: Bearer {token}
```

**Response:**
```json
[
  {
    "id": "1",
    "title": "Buy groceries",
    "description": "Milk, eggs, bread",
    "is_completed": false,
    "created_at": "2024-01-01T00:00:00Z"
  }
]
```

#### 2. Create Todo
```http
POST /todos
Authorization: Bearer {token}
Content-Type: application/json

{
  "title": "New todo",
  "description": "Todo description"
}
```

#### 3. Update Todo
```http
PUT /todos/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
  "title": "Updated title",
  "description": "Updated description",
  "is_completed": true
}
```

#### 4. Delete Todo
```http
DELETE /todos/{id}
Authorization: Bearer {token}
```

---

## Error Handling

### HTTP Status Codes

| Code | Meaning | Handling |
|------|---------|----------|
| 200 | Success | Return data |
| 201 | Created | Return created resource |
| 400 | Bad Request | Show validation errors |
| 401 | Unauthorized | Redirect to login |
| 403 | Forbidden | Show permission error |
| 404 | Not Found | Show not found error |
| 500 | Server Error | Show generic error |

### Error Response Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid email format",
    "details": {
      "field": "email",
      "reason": "Must be a valid email"
    }
  }
}
```

### Implementation

```dart
Future<Either<Failure, T>> _handleResponse<T>(
  Future<Response> Function() request,
  T Function(Map<String, dynamic>) fromJson,
) async {
  try {
    final response = await request();
    
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return Right(fromJson(response.data));
    } else {
      return Left(ServerFailure(_parseError(response)));
    }
  } on DioException catch (e) {
    return Left(_handleDioError(e));
  }
}

String _parseError(Response response) {
  try {
    final error = response.data['error'];
    return error['message'] ?? 'Unknown error';
  } catch (e) {
    return 'Server error';
  }
}
```

---

## Request/Response Interceptors

### Logging Interceptor

```dart
class LoggingInterceptor extends Interceptor {
  final Logger logger;
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('REQUEST[${options.method}] => ${options.uri}');
    logger.d('Headers: ${options.headers}');
    logger.d('Body: ${options.data}');
    super.onRequest(options, handler);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
    logger.d('Data: ${response.data}');
    super.onResponse(response, handler);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}');
    logger.e('Message: ${err.message}');
    super.onError(err, handler);
  }
}
```

### Retry Interceptor

```dart
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  
  RetryInterceptor({this.maxRetries = 3});
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] < maxRetries) {
      err.requestOptions.extra['retryCount'] = 
          (err.requestOptions.extra['retryCount'] ?? 0) + 1;
      
      // Exponential backoff
      await Future.delayed(
        Duration(seconds: pow(2, err.requestOptions.extra['retryCount']).toInt()),
      );
      
      try {
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
  
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.response?.statusCode == 503;
  }
}
```

---

## Testing API Integration

### Mock Server Setup

```dart
// test/helpers/mock_server.dart
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockServer {
  late DioAdapter dioAdapter;
  
  void setUp() {
    dioAdapter = DioAdapter(dio: Dio());
  }
  
  void mockLogin({required int statusCode, required dynamic data}) {
    dioAdapter.onPost(
      '/auth/login',
      (server) => server.reply(statusCode, data),
      data: anyNamed('data'),
    );
  }
  
  void mockGetTodos({required int statusCode, required dynamic data}) {
    dioAdapter.onGet(
      '/todos',
      (server) => server.reply(statusCode, data),
    );
  }
}
```

### Integration Tests

```dart
test('should login successfully with valid credentials', () async {
  // arrange
  mockServer.mockLogin(
    statusCode: 200,
    data: {
      'id': '1',
      'email': 'test@example.com',
      'token': 'test_token',
    },
  );
  
  // act
  final result = await remoteDataSource.login(
    email: 'test@example.com',
    password: 'password',
  );
  
  // assert
  expect(result.email, 'test@example.com');
  expect(result.token, 'test_token');
});
```

---

## Security Best Practices

### 1. Token Storage
```dart
// Store token securely
await secureStorage.write(key: 'auth_token', value: token);

// Read token
final token = await secureStorage.read(key: 'auth_token');

// Delete token on logout
await secureStorage.delete(key: 'auth_token');
```

### 2. API Key Protection
```dart
// Never hardcode API keys
❌ const apiKey = '12345-67890-abcdef';

// Use environment variables
✅ final apiKey = dotenv.env['API_KEY'];
```

### 3. Certificate Pinning (Production)
```dart
(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = 
    (client) {
  client.badCertificateCallback = (cert, host, port) {
    return cert.sha1.toString() == expectedCertFingerprint;
  };
  return client;
};
```

### 4. Request Signing
```dart
String _signRequest(Map<String, dynamic> data, String secret) {
  final message = json.encode(data);
  final hmac = Hmac(sha256, utf8.encode(secret));
  final digest = hmac.convert(utf8.encode(message));
  return digest.toString();
}
```

---

## Rate Limiting

Handle rate limiting with exponential backoff:

```dart
class RateLimitInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 429) {
      final retryAfter = err.response?.headers['Retry-After']?.first;
      final delay = int.tryParse(retryAfter ?? '60') ?? 60;
      
      logger.w('Rate limited. Retrying after $delay seconds');
      await Future.delayed(Duration(seconds: delay));
      
      try {
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
```

---

## Monitoring and Analytics

### API Call Tracking

```dart
class AnalyticsInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    analytics.logEvent(
      name: 'api_call',
      parameters: {
        'endpoint': response.requestOptions.path,
        'method': response.requestOptions.method,
        'status_code': response.statusCode,
        'duration_ms': response.requestOptions.receiveDataWhenStatusError ? 0 : 1000,
      },
    );
    super.onResponse(response, handler);
  }
}
```

---

## References

- [Dio Documentation](https://pub.dev/packages/dio)
- [HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- [REST API Best Practices](https://restfulapi.net/)
- [JWT Authentication](https://jwt.io/)
