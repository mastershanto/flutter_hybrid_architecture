import '../../domain/entities/todo.dart' as entity;
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

/// Implementation of TodoRepository using Drift
class TodoRepositoryImpl implements TodoRepository {
  final TodoDatabase database;

  TodoRepositoryImpl(this.database);

  @override
  Future<void> add(entity.Todo todo) async {
    await database.insertTodo(todo.toCompanion());
  }

  @override
  Future<void> delete(String id) async {
    await database.deleteTodoById(id);
  }

  @override
  Future<List<entity.Todo>> getTodos() async {
    final todos = await database.getAllTodos();
    return todos.map((t) => t.toEntity()).toList();
  }

  @override
  Future<void> toggle(String id) async {
    await database.toggleTodo(id);
  }

  @override
  Future<void> update(entity.Todo todo) async {
    await database.updateTodo(todo.toCompanion());
  }
}
