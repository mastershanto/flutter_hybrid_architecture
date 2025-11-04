import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/todo_repository.dart';

/// Use case for deleting a todo
class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<Either<Failure, void>> call(String id) async {
    return await repository.delete(id);
  }
}
