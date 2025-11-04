import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/entities/todo.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/usecases/add_todo.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late AddTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = AddTodo(mockRepository);
  });

  setUpAll(() {
    // Register fallback value for Todo
    registerFallbackValue(
      Todo(id: 'fallback', title: 'Fallback', createdAt: DateTime.now()),
    );
  });

  group('AddTodo', () {
    final tTodo = Todo(
      id: '1',
      title: 'New Todo',
      description: 'New Description',
      createdAt: DateTime(2024, 1, 1),
      done: false,
    );

    test('should add todo through repository when successful', () async {
      // arrange
      when(
        () => mockRepository.add(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(tTodo);

      // assert
      expect(result, const Right(null));
      verify(() => mockRepository.add(tTodo)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return CacheFailure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to add todo');
      when(
        () => mockRepository.add(any()),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tTodo);

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.add(tTodo)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle ServerFailure from repository', () async {
      // arrange
      const tFailure = ServerFailure('Server error');
      when(
        () => mockRepository.add(any()),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tTodo);

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.add(tTodo)).called(1);
    });

    test('should pass correct todo object to repository', () async {
      // arrange
      when(
        () => mockRepository.add(any()),
      ).thenAnswer((_) async => const Right(null));

      // act
      await useCase(tTodo);

      // assert
      final captured = verify(() => mockRepository.add(captureAny())).captured;
      expect(captured.first, tTodo);
    });
  });
}
