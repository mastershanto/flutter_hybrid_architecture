import 'package:dartz/dartz.dart';
import '../../domain/entities/todo.dart' as entity;
import '../../domain/repositories/todo_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/todo_local_data_source.dart';
import '../datasources/todo_remote_data_source.dart';
import '../models/todo_model.dart';
import 'package:logger/logger.dart';

final logger = Logger();

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
  Future<Either<Failure, void>> add(entity.Todo todo) async {
    try {
      // Always save to local first
      await localDataSource.insertTodo(todo.toCompanion());

      // Try to sync with remote if connected
      if (await networkInfo.isConnected) {
        try {
          final model = TodoModel.fromEntity(todo);
          await remoteDataSource.createTodo(model);
        } on ServerException catch (e) {
          logger.e('Failed to sync add to remote: ${e.message}');
          // Don't fail - already saved locally
        }
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error in add: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      // Delete from local
      await localDataSource.deleteTodoById(id);

      // Try to sync with remote if connected
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.deleteTodo(id);
        } on ServerException catch (e) {
          logger.e('Failed to sync delete to remote: ${e.message}');
          // Don't fail - already deleted locally
        }
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error in delete: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<entity.Todo>>> getTodos() async {
    try {
      // Check network connectivity
      if (await networkInfo.isConnected) {
        try {
          // Fetch from remote
          final remoteTodos = await remoteDataSource.getTodos();

          // Sync remote todos with local database
          for (final todoModel in remoteTodos) {
            final entity = todoModel.toEntity();
            // Use upsert to insert or update without constraint errors
            await localDataSource.upsertTodo(entity.toCompanion());
          }

          return Right(remoteTodos.map((m) => m.toEntity()).toList());
        } on ServerException catch (e) {
          logger.e(
            'Failed to fetch from remote, using local cache: ${e.message}',
          );
          // Fall back to local
          return _getLocalTodos();
        }
      } else {
        // No internet, use local
        return _getLocalTodos();
      }
    } catch (e) {
      logger.e('Unexpected error in getTodos: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<entity.Todo>>> _getLocalTodos() async {
    try {
      final todos = await localDataSource.getAllTodos();
      return Right(todos.map((t) => t.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Error fetching local todos: $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggle(String id) async {
    try {
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
        } on ServerException catch (e) {
          logger.e('Failed to sync toggle to remote: ${e.message}');
          // Don't fail - already toggled locally
        }
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error in toggle: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> update(entity.Todo todo) async {
    try {
      // Always update local first
      await localDataSource.updateTodo(todo.toCompanion());

      // Try to sync with remote if connected
      if (await networkInfo.isConnected) {
        try {
          final model = TodoModel.fromEntity(todo);
          await remoteDataSource.updateTodo(model);
        } on ServerException catch (e) {
          logger.e('Failed to sync update to remote: ${e.message}');
          // Don't fail - already updated locally
        }
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error in update: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }
}
