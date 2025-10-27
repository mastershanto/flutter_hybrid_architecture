import 'package:equatable/equatable.dart';

/// Todo entity representing a task item
class Todo extends Equatable {
  final String id;
  final String title;
  final String? description;
  final bool done;
  final DateTime createdAt;

  const Todo({
    required this.id,
    required this.title,
    this.description,
    this.done = false,
    required this.createdAt,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? done,
    DateTime? createdAt,
  }) => Todo(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    done: done ?? this.done,
    createdAt: createdAt ?? this.createdAt,
  );

  @override
  List<Object?> get props => [id, title, description, done, createdAt];
}
