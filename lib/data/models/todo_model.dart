import 'package:drift/drift.dart';
import '../../domain/entities/todo.dart' as entity;
import '../datasources/todo_local_data_source.dart';

/// Extension to convert Drift Todo model to domain entity
extension TodoModelX on Todo {
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
      id: Value(id),
      title: Value(title),
      description: Value(description),
      done: Value(done),
      createdAt: Value(createdAt),
    );
  }
}
