import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_event.freezed.dart';

/// Base class for all Todo events
@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.loadTodos() = LoadTodos;

  const factory TodoEvent.addTodo({
    required String title,
    String? description,
  }) = AddTodo;

  const factory TodoEvent.deleteTodo({required String id}) = DeleteTodo;

  const factory TodoEvent.toggleTodo({required String id}) = ToggleTodo;

  const factory TodoEvent.updateTodo({
    required String id,
    required String title,
    String? description,
  }) = UpdateTodo;
}
