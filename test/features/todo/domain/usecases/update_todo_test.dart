import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/entities/todo.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/usecases/update_todo.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late UpdateTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = UpdateTodo(mockRepository);
  });

  setUpAll(() {
    // Register fallback value for Todo
    registerFallbackValue(
      Todo(id: 'fallback', title: 'Fallback', createdAt: DateTime.now()),
    );
  });

  group('UpdateTodo', () {
    final tTodo = Todo(
      id: '1',
      title: 'Updated Todo',
      description: 'Updated Description',
      createdAt: DateTime(2024, 1, 1),
      done: true,
    );

    test('should update todo through repository when successful', () async {
      // arrange
      when(
        () => mockRepository.update(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(tTodo);

      // assert
      expect(result, const Right(null));
      verify(() => mockRepository.update(tTodo)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to update todo');
      when(
        () => mockRepository.update(any()),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tTodo);

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.update(tTodo)).called(1);
    });

    test('should pass correct todo object to repository', () async {
      // arrange
      when(
        () => mockRepository.update(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await useCase(tTodo);

      // assert
      final captured = verify(
        () => mockRepository.update(captureAny()),
      ).captured;
      expect(captured.first, tTodo);
    });
  });
}
