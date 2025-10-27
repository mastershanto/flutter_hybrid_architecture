/// Base exception class
class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

/// Exception for cache-related errors
class CacheException extends AppException {
  const CacheException([String message = 'Cache exception occurred'])
    : super(message);
}

/// Exception for server-related errors
class ServerException extends AppException {
  const ServerException([String message = 'Server exception occurred'])
    : super(message);
}

/// Exception for validation errors
class ValidationException extends AppException {
  const ValidationException([String message = 'Validation exception occurred'])
    : super(message);
}
