import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../../features/todo/data/datasources/todo_local_data_source.dart';
import '../../features/todo/data/datasources/todo_remote_data_source.dart';
import '../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../features/todo/domain/repositories/todo_repository.dart';
import '../../features/todo/presentation/bloc/todo/todo_bloc.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/signup.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';

/// GetIt service locator instance
final getIt = GetIt.instance;

/// Riverpod provider for TodoBloc
final todoBlocProvider = Provider<TodoBloc>((ref) {
  return TodoBloc(ref.watch(todoRepositoryProvider));
});

/// Riverpod provider for TodoRepository
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return getIt<TodoRepository>();
});

/// Riverpod provider for AuthBloc
final authBlocProvider = Provider<AuthBloc>((ref) {
  return getIt<AuthBloc>();
});

/// Riverpod provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return getIt<AuthRepository>();
});

/// Initialize the dependency injection container
Future<void> initDependencies() async {
  // Core - Network
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );

  // Core - HTTP Client
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(
      // Change this to your API base URL
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  // Todo Feature - Data Sources
  getIt.registerLazySingleton<TodoDatabase>(() => TodoDatabase());
  getIt.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(getIt<DioClient>()),
  );

  // Todo Feature - Repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: getIt<TodoDatabase>(),
      remoteDataSource: getIt<TodoRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Auth Feature - Data Sources
  getIt.registerLazySingleton<AuthDatabase>(() => AuthDatabase());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<DioClient>()),
  );

  // Auth Feature - Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthDatabase>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Auth Feature - Use Cases
  getIt.registerLazySingleton<Login>(() => Login(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignUp>(() => SignUp(getIt<AuthRepository>()));
  getIt.registerLazySingleton<Logout>(() => Logout(getIt<AuthRepository>()));
  getIt.registerLazySingleton<GetCurrentUser>(
    () => GetCurrentUser(getIt<AuthRepository>()),
  );

  // Auth Feature - BLoC
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt<Login>(),
      signUpUseCase: getIt<SignUp>(),
      logoutUseCase: getIt<Logout>(),
      getCurrentUserUseCase: getIt<GetCurrentUser>(),
    ),
  );
}
