import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/entities/todo.dart';
import 'package:todo_flutter_hybrid/features/todo/presentation/bloc/todo/todo_bloc.dart';
import 'package:todo_flutter_hybrid/features/todo/presentation/bloc/todo/todo_event.dart';
import 'package:todo_flutter_hybrid/features/todo/presentation/bloc/todo/todo_state.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late TodoBloc bloc;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    bloc = TodoBloc(mockRepository);
  });

  setUpAll(() {
    // Register fallback values
    registerFallbackValue(
      Todo(id: 'fallback', title: 'Fallback', createdAt: DateTime.now()),
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('TodoBloc', () {
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
        createdAt: DateTime(2024, 1, 2),
        done: true,
      ),
    ];

    test('initial state should be TodoInitial', () {
      expect(bloc.state, const TodoState.initial());
    });

    group('LoadTodos', () {
      blocTest<TodoBloc, TodoState>(
        'should emit [loading, loaded] when getTodos succeeds',
        build: () {
          when(
            () => mockRepository.getTodos(),
          ).thenAnswer((_) async => Right(tTodoList));
          return bloc;
        },
        act: (bloc) => bloc.add(const TodoEvent.loadTodos()),
        expect: () => [
          const TodoState.loading(),
          TodoState.loaded(todos: tTodoList),
        ],
        verify: (_) {
          verify(() => mockRepository.getTodos()).called(1);
        },
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [loading, error] when getTodos fails',
        build: () {
          when(
            () => mockRepository.getTodos(),
          ).thenAnswer((_) async => const Left(CacheFailure('Cache error')));
          return bloc;
        },
        act: (bloc) => bloc.add(const TodoEvent.loadTodos()),
        expect: () => [
          const TodoState.loading(),
          const TodoState.error(message: 'Cache error'),
        ],
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [loading, loaded] with empty list when no todos',
        build: () {
          when(
            () => mockRepository.getTodos(),
          ).thenAnswer((_) async => const Right([]));
          return bloc;
        },
        act: (bloc) => bloc.add(const TodoEvent.loadTodos()),
        expect: () => [
          const TodoState.loading(),
          const TodoState.loaded(todos: []),
        ],
      );
    });

    group('AddTodo', () {
      const tTitle = 'New Todo';
      const tDescription = 'New Description';

      blocTest<TodoBloc, TodoState>(
        'should emit [loaded] with new todo added when add succeeds',
        build: () {
          when(
            () => mockRepository.add(any()),
          ).thenAnswer((_) async => const Right(null));
          return bloc;
        },
        act: (bloc) => bloc.add(
          const TodoEvent.addTodo(title: tTitle, description: tDescription),
        ),
        expect: () => [
          predicate<TodoState>((state) {
            return state.maybeWhen(
              loaded: (todos) =>
                  todos.length == 1 &&
                  todos.first.title == tTitle &&
                  todos.first.description == tDescription,
              orElse: () => false,
            );
          }),
        ],
        verify: (_) {
          verify(() => mockRepository.add(any())).called(1);
        },
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [error] when add fails',
        build: () {
          when(
            () => mockRepository.add(any()),
          ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
          return bloc;
        },
        act: (bloc) => bloc.add(
          const TodoEvent.addTodo(title: tTitle, description: tDescription),
        ),
        expect: () => [const TodoState.error(message: 'Server error')],
      );
    });

    group('DeleteTodo', () {
      const tTodoId = '1';

      blocTest<TodoBloc, TodoState>(
        'should emit [loaded] with todo removed when delete succeeds',
        build: () {
          when(
            () => mockRepository.delete(any()),
          ).thenAnswer((_) async => const Right(null));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(const TodoEvent.deleteTodo(id: tTodoId)),
        expect: () => [
          predicate<TodoState>((state) {
            return state.maybeWhen(
              loaded: (todos) =>
                  todos.length == 1 && !todos.any((t) => t.id == tTodoId),
              orElse: () => false,
            );
          }),
        ],
        verify: (_) {
          verify(() => mockRepository.delete(tTodoId)).called(1);
        },
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [error] when delete fails',
        build: () {
          when(
            () => mockRepository.delete(any()),
          ).thenAnswer((_) async => const Left(CacheFailure('Delete failed')));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(const TodoEvent.deleteTodo(id: tTodoId)),
        expect: () => [const TodoState.error(message: 'Delete failed')],
      );
    });

    group('ToggleTodo', () {
      const tTodoId = '1';

      blocTest<TodoBloc, TodoState>(
        'should emit [loading, loaded] when toggle succeeds',
        build: () {
          when(
            () => mockRepository.toggle(any()),
          ).thenAnswer((_) async => const Right(null));
          when(
            () => mockRepository.getTodos(),
          ).thenAnswer((_) async => Right(tTodoList));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(const TodoEvent.toggleTodo(id: tTodoId)),
        expect: () => [
          const TodoState.loading(),
          TodoState.loaded(todos: tTodoList),
        ],
        verify: (_) {
          verify(() => mockRepository.toggle(tTodoId)).called(1);
          verify(() => mockRepository.getTodos()).called(1);
        },
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [error] when toggle fails',
        build: () {
          when(
            () => mockRepository.toggle(any()),
          ).thenAnswer((_) async => const Left(CacheFailure('Toggle failed')));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(const TodoEvent.toggleTodo(id: tTodoId)),
        expect: () => [const TodoState.error(message: 'Toggle failed')],
      );
    });

    group('UpdateTodo', () {
      const tTodoId = '1';
      const tNewTitle = 'Updated Title';
      const tNewDescription = 'Updated Description';

      blocTest<TodoBloc, TodoState>(
        'should emit [loading, loaded] when update succeeds',
        build: () {
          when(
            () => mockRepository.update(any()),
          ).thenAnswer((_) async => const Right(null));
          when(
            () => mockRepository.getTodos(),
          ).thenAnswer((_) async => Right(tTodoList));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(
          const TodoEvent.updateTodo(
            id: tTodoId,
            title: tNewTitle,
            description: tNewDescription,
          ),
        ),
        expect: () => [
          const TodoState.loading(),
          TodoState.loaded(todos: tTodoList),
        ],
        verify: (_) {
          verify(() => mockRepository.update(any())).called(1);
          verify(() => mockRepository.getTodos()).called(1);
        },
      );

      blocTest<TodoBloc, TodoState>(
        'should emit [error] when update fails',
        build: () {
          when(
            () => mockRepository.update(any()),
          ).thenAnswer((_) async => const Left(ServerFailure('Update failed')));
          return bloc;
        },
        seed: () => TodoState.loaded(todos: tTodoList),
        act: (bloc) => bloc.add(
          const TodoEvent.updateTodo(
            id: tTodoId,
            title: tNewTitle,
            description: tNewDescription,
          ),
        ),
        expect: () => [const TodoState.error(message: 'Update failed')],
      );
    });
  });
}
