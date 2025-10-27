import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for updating an existing todo
class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(Todo todo) async {
    return await repository.update(todo);
  }
}
