import 'package:flutter/material.dart';
import '../../../domain/entities/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/todo/todo_bloc.dart';
import '../blocs/todo/todo_event.dart';
import '../screens/edit_todo_screen.dart';

/// Widget to display a single todo item
class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (_) {
            context.read<TodoBloc>().add(TodoEvent.toggleTodo(id: todo.id));
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.done ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: todo.description != null ? Text(todo.description!) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<TodoBloc>(),
                      child: EditTodoScreen(todo: todo),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                context.read<TodoBloc>().add(TodoEvent.deleteTodo(id: todo.id));
              },
            ),
          ],
        ),
      ),
    );
  }
}
