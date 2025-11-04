import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/usecases/delete_todo.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late DeleteTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = DeleteTodo(mockRepository);
  });

  group('DeleteTodo', () {
    const tTodoId = '1';

    test('should delete todo through repository when successful', () async {
      // arrange
      when(
        () => mockRepository.delete(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(tTodoId);

      // assert
      expect(result, const Right(null));
      verify(() => mockRepository.delete(tTodoId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to delete todo');
      when(
        () => mockRepository.delete(any()),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tTodoId);

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.delete(tTodoId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should pass correct id to repository', () async {
      // arrange
      when(
        () => mockRepository.delete(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await useCase(tTodoId);

      // assert
      final captured = verify(
        () => mockRepository.delete(captureAny()),
      ).captured;
      expect(captured.first, tTodoId);
    });

    test('should handle different todo ids', () async {
      // arrange
      const differentId = '999';
      when(
        () => mockRepository.delete(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(differentId);

      // assert
      expect(result, const Right(null));
      verify(() => mockRepository.delete(differentId)).called(1);
    });
  });
}
