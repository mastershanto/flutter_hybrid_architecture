import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../blocs/todo/todo_bloc.dart';
import '../blocs/todo/todo_event.dart';
import '../blocs/todo/todo_state.dart';
import '../widgets/todo_tile.dart';
import '../../di.dart';
import 'add_todo_screen.dart';

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

    return BlocProvider.value(
      value: todoBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: todoBloc,
                  child: const AddTodoScreen(),
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
