/// Base exception class
class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

/// Exception for cache-related errors
class CacheException extends AppException {
  const CacheException([super.message = 'Cache exception occurred']);
}

/// Exception for server-related errors
class ServerException extends AppException {
  const ServerException([super.message = 'Server exception occurred']);
}

/// Exception for validation errors
class ValidationException extends AppException {
  const ValidationException([super.message = 'Validation exception occurred']);
}
