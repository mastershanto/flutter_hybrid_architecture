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
    emit(const TodoState.loading());
    final result = await repository.getTodos();
    result.fold(
      (failure) => emit(TodoState.error(message: failure.message)),
      (todos) => emit(TodoState.loaded(todos: todos)),
    );
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
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

    final result = await repository.add(todo);
    result.fold(
      (failure) => emit(TodoState.error(message: failure.message)),
      (_) => emit(TodoState.loaded(todos: [...current, todo])),
    );
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    final result = await repository.delete(event.id);

    result.fold((failure) => emit(TodoState.error(message: failure.message)), (
      _,
    ) {
      final current = state.maybeWhen(
        loaded: (todos) => todos,
        orElse: () => <Todo>[],
      );
      final updated = current.where((t) => t.id != event.id).toList();
      emit(TodoState.loaded(todos: updated));
    });
  }

  Future<void> _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) async {
    final result = await repository.toggle(event.id);
    result.fold(
      (failure) => emit(TodoState.error(message: failure.message)),
      (_) => add(const TodoEvent.loadTodos()),
    );
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    final current = state.maybeWhen(
      loaded: (todos) => todos,
      orElse: () => <Todo>[],
    );

    final todoToUpdate = current.firstWhere((t) => t.id == event.id);
    final updatedTodo = todoToUpdate.copyWith(
      title: event.title,
      description: event.description,
    );

    final result = await repository.update(updatedTodo);
    result.fold(
      (failure) => emit(TodoState.error(message: failure.message)),
      (_) => add(const TodoEvent.loadTodos()),
    );
  }
}
