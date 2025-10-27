import '../../domain/entities/todo.dart' as entity;
import '../../domain/repositories/todo_repository.dart';
import '../../core/network/network_info.dart';
import '../datasources/todo_local_data_source.dart';
import '../datasources/todo_remote_data_source.dart';
import '../models/todo_model.dart';

/// Implementation of TodoRepository using Drift and Remote API
class TodoRepositoryImpl implements TodoRepository {
  final TodoDatabase localDataSource;
  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> add(entity.Todo todo) async {
    // Always save to local first
    await localDataSource.insertTodo(todo.toCompanion());

    // Try to sync with remote if connected
    if (await networkInfo.isConnected) {
      try {
        final model = TodoModel.fromEntity(todo);
        await remoteDataSource.createTodo(model);
      } catch (e) {
        // Log error but don't fail - already saved locally
        print('Failed to sync add to remote: $e');
      }
    }
  }

  @override
  Future<void> delete(String id) async {
    // Delete from local
    await localDataSource.deleteTodoById(id);

    // Try to sync with remote if connected
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTodo(id);
      } catch (e) {
        print('Failed to sync delete to remote: $e');
      }
    }
  }

  @override
  Future<List<entity.Todo>> getTodos() async {
    // Check network connectivity
    if (await networkInfo.isConnected) {
      try {
        // Fetch from remote
        final remoteTodos = await remoteDataSource.getTodos();

        // Update local cache
        for (final todoModel in remoteTodos) {
          final entity = todoModel.toEntity();
          await localDataSource.insertTodo(entity.toCompanion());
        }

        return remoteTodos.map((m) => m.toEntity()).toList();
      } catch (e) {
        print('Failed to fetch from remote, using local cache: $e');
        // Fall back to local
        return _getLocalTodos();
      }
    } else {
      // No internet, use local
      return _getLocalTodos();
    }
  }

  Future<List<entity.Todo>> _getLocalTodos() async {
    final todos = await localDataSource.getAllTodos();
    return todos.map((t) => t.toEntity()).toList();
  }

  @override
  Future<void> toggle(String id) async {
    await localDataSource.toggleTodo(id);

    // Try to sync with remote if connected
    if (await networkInfo.isConnected) {
      try {
        final todo = await localDataSource.getTodoById(id);
        if (todo != null) {
          final entity = todo.toEntity();
          final model = TodoModel.fromEntity(entity);
          await remoteDataSource.updateTodo(model);
        }
      } catch (e) {
        print('Failed to sync toggle to remote: $e');
      }
    }
  }

  @override
  Future<void> update(entity.Todo todo) async {
    await localDataSource.updateTodo(todo.toCompanion());

    // Try to sync with remote if connected
    if (await networkInfo.isConnected) {
      try {
        final model = TodoModel.fromEntity(todo);
        await remoteDataSource.updateTodo(model);
      } catch (e) {
        print('Failed to sync update to remote: $e');
      }
    }
  }
}
