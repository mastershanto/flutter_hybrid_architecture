import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart' as entity;
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

final logger = Logger();

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

        logger.i('Login successful: ${userModel.email}');
        return Right(userModel.toEntity());
      } on ServerException catch (e) {
        logger.e('Login failed: ${e.message}');
        return Left(ServerFailure(e.message));
      }
    } else {
      logger.w('Login failed: No internet connection');
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

        logger.i('Sign up successful: ${userModel.email}');
        return Right(userModel.toEntity());
      } on ServerException catch (e) {
        logger.e('Sign up failed: ${e.message}');
        return Left(ServerFailure(e.message));
      }
    } else {
      logger.w('Sign up failed: No internet connection');
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

      logger.i('Logout successful');
      return const Right(null);
    } on CacheException catch (e) {
      logger.e('Logout failed: ${e.message}');
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected logout error: $e');
      return Left(GeneralFailure(e.toString()));
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
    } on CacheException catch (e) {
      logger.e('Failed to get current user: ${e.message}');
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error getting current user: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final hasUser = await localDataSource.hasUser();
      return Right(hasUser);
    } on CacheException catch (e) {
      logger.e('Failed to check login status: ${e.message}');
      return Left(CacheFailure(e.message));
    } catch (e) {
      logger.e('Unexpected error checking login status: $e');
      return Left(GeneralFailure(e.toString()));
    }
  }
}
