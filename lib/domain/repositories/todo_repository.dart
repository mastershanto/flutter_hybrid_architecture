import '../entities/todo.dart';

/// Repository interface for Todo operations
abstract class TodoRepository {
  /// Get all todos
  Future<List<Todo>> getTodos();

  /// Add a new todo
  Future<void> add(Todo todo);

  /// Delete a todo by id
  Future<void> delete(String id);

  /// Toggle the done status of a todo
  Future<void> toggle(String id);

  /// Update an existing todo
  Future<void> update(Todo todo);
}
