import '../../../../core/error/exceptions.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_model.dart';

/// Abstract class for authentication remote data source
abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<void> logout();
}

/// Implementation of authentication remote data source
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      // For demo purposes, using JSONPlaceholder users endpoint
      // In production, replace with your actual auth endpoint
      final response = await dioClient.get('/users/1');

      // Simulate login response
      final userData = {
        'id': response.data['id'].toString(),
        'email': email,
        'name': response.data['name'],
        'token': 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        'created_at': DateTime.now().toIso8601String(),
      };

      return UserModel.fromJson(userData);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // For demo purposes, creating a mock user
      // In production, replace with your actual signup endpoint
      final response = await dioClient.post(
        '/users',
        data: {'email': email, 'name': name},
      );

      // Simulate signup response
      final userData = {
        'id':
            response.data['id']?.toString() ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        'email': email,
        'name': name,
        'token': 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        'created_at': DateTime.now().toIso8601String(),
      };

      return UserModel.fromJson(userData);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      // For demo purposes, no actual API call
      // In production, call your logout endpoint to invalidate token
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      throw ServerException();
    }
  }
}
