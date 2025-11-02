import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/todo/presentation/screens/add_todo_screen.dart';
import '../../features/todo/presentation/screens/edit_todo_screen.dart';
import '../../features/todo/domain/entities/todo.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/profile_screen.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../features/product/presentation/bloc/product_bloc.dart';
import '../../features/product/presentation/screens/product_list_screen.dart';
import '../../features/vehicle/presentation/bloc/vehicle_bloc.dart';
import '../../features/vehicle/presentation/bloc/vehicle_event.dart';
import '../../features/vehicle/presentation/screens/vehicle_categories_screen.dart';
import '../presentation/main_navigation_screen.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../di/injection.dart';
import 'app_routes.dart';

/// GoRouter configuration for the app
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      // Get auth repository to check login status
      final authRepository = getIt<AuthRepository>();
      final result = await authRepository.isLoggedIn();

      // Default to not logged in if there's an error
      final isLoggedIn = result.fold(
        (failure) => false,
        (loggedIn) => loggedIn,
      );

      final isOnSplash = state.matchedLocation == AppRoutes.splash;
      final isOnAuth =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.signUp;

      // If on splash, let it handle the redirect
      if (isOnSplash) return null;

      // If logged in and trying to access auth pages, redirect to home
      if (isLoggedIn && isOnAuth) {
        return AppRoutes.home;
      }

      // If not logged in and trying to access protected pages, redirect to login
      if (!isLoggedIn && !isOnAuth) {
        return AppRoutes.login;
      }

      return null;
    },
    routes: [
      // Splash route
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splashName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: SplashScreen(
              onAuthChecked: (isAuthenticated) {
                if (isAuthenticated) {
                  context.go(AppRoutes.home);
                } else {
                  context.go(AppRoutes.login);
                }
              },
            ),
          ),
        ),
      ),

      // Login route
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.loginName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const LoginScreen(),
          ),
        ),
      ),

      // Sign Up route
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUpName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const SignUpScreen(),
          ),
        ),
      ),

      // Profile route
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profileName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: const ProfileScreen(),
          ),
        ),
      ),

      // Home route
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MainNavigationScreen(),
        ),
      ),

      // Product List route
      GoRoute(
        path: AppRoutes.productList,
        name: AppRoutes.productListName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => getIt<ProductBloc>()..add(LoadProducts()),
            child: const ProductListScreen(),
          ),
        ),
      ),

      // Vehicle Categories route
      GoRoute(
        path: AppRoutes.vehicleCategories,
        name: AppRoutes.vehicleCategoriesName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) =>
                getIt<VehicleBloc>()..add(LoadVehicleCategories()),
            child: const VehicleCategoriesScreen(),
          ),
        ),
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
