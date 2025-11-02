import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/usecases/toggle_todo.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late ToggleTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = ToggleTodo(mockRepository);
  });

  group('ToggleTodo', () {
    const tTodoId = '1';

    test('should toggle todo through repository when successful', () async {
      // arrange
      when(
        () => mockRepository.toggle(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(tTodoId);

      // assert
      expect(result, const Right(null));
      verify(() => mockRepository.toggle(tTodoId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to toggle todo');
      when(
        () => mockRepository.toggle(any()),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tTodoId);

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.toggle(tTodoId)).called(1);
    });

    test('should pass correct id to repository', () async {
      // arrange
      when(
        () => mockRepository.toggle(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await useCase(tTodoId);

      // assert
      final captured = verify(
        () => mockRepository.toggle(captureAny()),
      ).captured;
      expect(captured.first, tTodoId);
    });
  });
}
