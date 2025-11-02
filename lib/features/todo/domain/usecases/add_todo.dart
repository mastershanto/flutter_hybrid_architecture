import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for adding a new todo
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(Todo todo) async {
    return await repository.add(todo);
  }
}
