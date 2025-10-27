import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/error/exceptions.dart';
import '../models/todo_model.dart';

/// Abstract class for remote todo data source
abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<TodoModel> getTodoById(String id);
  Future<TodoModel> createTodo(TodoModel todo);
  Future<TodoModel> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
}

/// Implementation of TodoRemoteDataSource using Dio
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final DioClient dioClient;

  TodoRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await dioClient.get('/todos');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((json) => TodoModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException('Failed to load todos');
      }
    } on DioException catch (e) {
      throw ServerException(_handleDioError(e));
    }
  }

  @override
  Future<TodoModel> getTodoById(String id) async {
    try {
      final response = await dioClient.get('/todos/$id');

      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to load todo');
      }
    } on DioException catch (e) {
      throw ServerException(_handleDioError(e));
    }
  }

  @override
  Future<TodoModel> createTodo(TodoModel todo) async {
    try {
      final response = await dioClient.post('/todos', data: todo.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        return TodoModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to create todo');
      }
    } on DioException catch (e) {
      throw ServerException(_handleDioError(e));
    }
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todo) async {
    try {
      final response = await dioClient.put(
        '/todos/${todo.id}',
        data: todo.toJson(),
      );

      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException('Failed to update todo');
      }
    } on DioException catch (e) {
      throw ServerException(_handleDioError(e));
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      final response = await dioClient.delete('/todos/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw ServerException('Failed to delete todo');
      }
    } on DioException catch (e) {
      throw ServerException(_handleDioError(e));
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'No internet connection';
      default:
        return 'Something went wrong';
    }
  }
}
