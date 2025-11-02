import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_event.dart';
import '../bloc/todo/todo_state.dart';
import '../widgets/todo_tile.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_routes.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth/auth_state.dart';

/// Home screen displaying the list of todos
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load todos when screen is initialized
    Future.microtask(() {
      ref.read(todoBlocProvider).add(const TodoEvent.loadTodos());
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = ref.watch(todoBlocProvider);
    final authBloc = ref.watch(authBlocProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: todoBloc),
        BlocProvider.value(value: authBloc),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            unauthenticated: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
              context.go(AppRoutes.login);
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'Profile',
                onPressed: () => context.push(AppRoutes.profile),
              ),
            ],
          ),
          body: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return state.when(
                initial: () =>
                    const Center(child: Text('No todos yet. Add one!')),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (todos) {
                  if (todos.isEmpty) {
                    return const Center(child: Text('No todos yet. Add one!'));
                  }
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (_, i) => TodoTile(todo: todos[i]),
                  );
                },
                error: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text('Error: $message'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            const TodoEvent.loadTodos(),
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushNamed(AppRoutes.addTodoName);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
