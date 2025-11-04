import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/entities/todo.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/usecases/get_todos.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late GetTodos useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = GetTodos(mockRepository);
  });

  group('GetTodos', () {
    final tTodoList = [
      Todo(
        id: '1',
        title: 'Test Todo 1',
        description: 'Description 1',
        createdAt: DateTime(2024, 1, 1),
        done: false,
      ),
      Todo(
        id: '2',
        title: 'Test Todo 2',
        description: 'Description 2',
        createdAt: DateTime(2024, 1, 2),
        done: true,
      ),
    ];

    test(
      'should return list of todos from repository when successful',
      () async {
        // arrange
        when(
          () => mockRepository.getTodos(),
        ).thenAnswer((_) async => Right(tTodoList));

        // act
        final result = await useCase();

        // assert
        expect(result, Right(tTodoList));
        verify(() => mockRepository.getTodos()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return CacheFailure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Cache error');
      when(
        () => mockRepository.getTodos(),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase();

      // assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.getTodos()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should return ServerFailure when repository fails with server error',
      () async {
        // arrange
        const tFailure = ServerFailure('Server error');
        when(
          () => mockRepository.getTodos(),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase();

        // assert
        expect(result, const Left(tFailure));
        verify(() => mockRepository.getTodos()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return empty list when no todos exist', () async {
      // arrange
      when(
        () => mockRepository.getTodos(),
      ).thenAnswer((_) async => const Right(<Todo>[]));

      // act
      final result = await useCase();

      // assert
      expect(result.isRight(), true);
      result.fold(
        (failure) => fail('Should not return failure'),
        (todos) => expect(todos, isEmpty),
      );
      verify(() => mockRepository.getTodos()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
