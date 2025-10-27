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
  const CacheFailure([super.message = 'Cache failure occurred']);
}

/// Failure for server/network related errors
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server failure occurred']);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failure occurred']);
}

/// Generic failure
class GeneralFailure extends Failure {
  const GeneralFailure([super.message = 'An error occurred']);
}
