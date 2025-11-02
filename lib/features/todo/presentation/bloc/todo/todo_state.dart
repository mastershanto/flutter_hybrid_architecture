import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/todo.dart';

part 'todo_state.freezed.dart';

/// Base class for all Todo states
@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;

  const factory TodoState.loading() = TodoLoading;

  const factory TodoState.loaded({required List<Todo> todos}) = TodoLoaded;

  const factory TodoState.error({required String message}) = TodoError;
}
