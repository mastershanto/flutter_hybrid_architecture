import '../repositories/todo_repository.dart';

/// Use case for toggling a todo's done status
class ToggleTodo {
  final TodoRepository repository;

  ToggleTodo(this.repository);

  Future<void> call(String id) async {
    return await repository.toggle(id);
  }
}
