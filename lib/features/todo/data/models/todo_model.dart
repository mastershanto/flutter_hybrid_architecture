import 'package:drift/drift.dart' as drift;
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/todo.dart' as entity;
import '../datasources/todo_local_data_source.dart';

part 'todo_model.g.dart';

/// TodoModel for API JSON serialization
@JsonSerializable()
class TodoModel {
  @JsonKey(fromJson: _idFromJson)
  final String id;
  final String title;
  final String? description;
  @JsonKey(name: 'completed')
  final bool done;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const TodoModel({
    required this.id,
    required this.title,
    this.description,
    this.done = false,
    this.createdAt,
  });

  // Helper method to convert int id to String
  static String _idFromJson(dynamic id) => id.toString();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  entity.Todo toEntity() {
    return entity.Todo(
      id: id,
      title: title,
      description: description,
      done: done,
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  factory TodoModel.fromEntity(entity.Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      done: todo.done,
      createdAt: todo.createdAt,
    );
  }
}

/// Extension to convert Drift Todo model to domain entity
extension DriftTodoX on Todo {
  entity.Todo toEntity() {
    return entity.Todo(
      id: id,
      title: title,
      description: description,
      done: done,
      createdAt: createdAt,
    );
  }
}

/// Extension to convert domain entity to Drift companion
extension TodoEntityX on entity.Todo {
  TodosCompanion toCompanion() {
    return TodosCompanion(
      id: drift.Value(id),
      title: drift.Value(title),
      description: drift.Value(description),
      done: drift.Value(done),
      createdAt: drift.Value(createdAt),
    );
  }
}
