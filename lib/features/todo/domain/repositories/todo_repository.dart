import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/todo.dart';

/// Repository interface for Todo operations
abstract class TodoRepository {
  /// Get all todos
  Future<Either<Failure, List<Todo>>> getTodos();

  /// Add a new todo
  Future<Either<Failure, void>> add(Todo todo);

  /// Delete a todo by id
  Future<Either<Failure, void>> delete(String id);

  /// Toggle the done status of a todo
  Future<Either<Failure, void>> toggle(String id);

  /// Update an existing todo
  Future<Either<Failure, void>> update(Todo todo);
}
