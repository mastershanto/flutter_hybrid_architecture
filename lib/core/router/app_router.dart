import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/add_todo_screen.dart';
import '../../presentation/screens/edit_todo_screen.dart';
import '../../domain/entities/todo.dart';
import 'app_routes.dart';

/// GoRouter configuration for the app
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      // Home route
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const HomeScreen()),
      ),

      // Add Todo route
      GoRoute(
        path: AppRoutes.addTodo,
        name: AppRoutes.addTodoName,
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const AddTodoScreen()),
      ),

      // Edit Todo route
      GoRoute(
        path: AppRoutes.editTodo,
        name: AppRoutes.editTodoName,
        pageBuilder: (context, state) {
          final todo = state.extra as Todo;
          return MaterialPage(
            key: state.pageKey,
            child: EditTodoScreen(todo: todo),
          );
        },
      ),
    ],

    // Error page
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.matchedLocation}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
