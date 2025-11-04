import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for updating an existing todo
class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<Either<Failure, void>> call(Todo todo) async {
    return await repository.update(todo);
  }
}
