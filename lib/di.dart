import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/todo_local_data_source.dart';
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
  // Register database
  final database = TodoDatabase();
  getIt.registerSingleton<TodoDatabase>(database);

  // Register repository
  getIt.registerSingleton<TodoRepository>(TodoRepositoryImpl(database));
}
