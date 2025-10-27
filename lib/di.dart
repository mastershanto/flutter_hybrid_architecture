import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'core/network/dio_client.dart';
import 'core/network/network_info.dart';
import 'data/datasources/todo_local_data_source.dart';
import 'data/datasources/todo_remote_data_source.dart';
import 'data/repositories/todo_repository_impl.dart';
import 'domain/repositories/todo_repository.dart';
import 'presentation/blocs/todo/todo_bloc.dart';

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

  // Data Sources
  getIt.registerLazySingleton<TodoDatabase>(() => TodoDatabase());
  getIt.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(getIt<DioClient>()),
  );

  // Repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: getIt<TodoDatabase>(),
      remoteDataSource: getIt<TodoRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
}
