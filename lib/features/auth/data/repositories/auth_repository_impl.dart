import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart' as entity;
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

/// Implementation of authentication repository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthDatabase localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, entity.User>> login({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        // Login via API
        final userModel = await remoteDataSource.login(
          email: email,
          password: password,
        );

        // Save user locally
        await localDataSource.saveUser(userModel.toEntity().toCompanion());

        print('✅ Login successful: ${userModel.email}');
        return Right(userModel.toEntity());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, entity.User>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        // Sign up via API
        final userModel = await remoteDataSource.signUp(
          email: email,
          password: password,
          name: name,
        );

        // Save user locally
        await localDataSource.saveUser(userModel.toEntity().toCompanion());

        print('✅ Sign up successful: ${userModel.email}');
        return Right(userModel.toEntity());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Logout from API (if connected)
      if (await networkInfo.isConnected) {
        await remoteDataSource.logout();
      }

      // Clear local user data
      await localDataSource.deleteUser();

      print('✅ Logout successful');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, entity.User?>> getCurrentUser() async {
    try {
      final driftUser = await localDataSource.getCurrentUser();
      if (driftUser == null) {
        return const Right(null);
      }
      return Right(driftUser.toEntity());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      return await localDataSource.hasUser();
    } catch (e) {
      return false;
    }
  }
}
