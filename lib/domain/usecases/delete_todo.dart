import '../repositories/todo_repository.dart';

/// Use case for deleting a todo
class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<void> call(String id) async {
    return await repository.delete(id);
  }
}
