import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Failure for database/cache related errors
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache failure occurred'])
    : super(message);
}

/// Failure for server/network related errors
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server failure occurred'])
    : super(message);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation failure occurred'])
    : super(message);
}

/// Generic failure
class GeneralFailure extends Failure {
  const GeneralFailure([String message = 'An error occurred']) : super(message);
}
