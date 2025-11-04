import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for adding a new todo
class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<Either<Failure, void>> call(Todo todo) async {
    return await repository.add(todo);
  }
}
