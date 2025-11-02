import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../../../domain/repositories/todo_repository.dart';
import '../../../domain/entities/todo.dart';

/// BLoC for managing Todo state and events
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(const TodoState.initial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodo>(_onToggleTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    try {
      emit(const TodoState.loading());
      final todos = await repository.getTodos();
      emit(TodoState.loaded(todos: todos));
    } catch (e) {
      emit(TodoState.error(message: e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      final current = state.maybeWhen(
        loaded: (todos) => todos,
        orElse: () => <Todo>[],
      );

      final todo = Todo(
        id: const Uuid().v4(),
        title: event.title,
        description: event.description,
        createdAt: DateTime.now(),
      );

      await repository.add(todo);
      emit(TodoState.loaded(todos: [...current, todo]));
    } catch (e) {
      emit(TodoState.error(message: e.toString()));
    }
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.delete(event.id);

      final current = state.maybeWhen(
        loaded: (todos) => todos,
        orElse: () => <Todo>[],
      );

      final updated = current.where((t) => t.id != event.id).toList();
      emit(TodoState.loaded(todos: updated));
    } catch (e) {
      emit(TodoState.error(message: e.toString()));
    }
  }

  Future<void> _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.toggle(event.id);
      add(const TodoEvent.loadTodos());
    } catch (e) {
      emit(TodoState.error(message: e.toString()));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    try {
      final current = state.maybeWhen(
        loaded: (todos) => todos,
        orElse: () => <Todo>[],
      );

      final todoToUpdate = current.firstWhere((t) => t.id == event.id);
      final updatedTodo = todoToUpdate.copyWith(
        title: event.title,
        description: event.description,
      );

      await repository.update(updatedTodo);
      add(const TodoEvent.loadTodos());
    } catch (e) {
      emit(TodoState.error(message: e.toString()));
    }
  }
}
