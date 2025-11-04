import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/core/error/failures.dart';
import 'package:todo_flutter_hybrid/features/auth/domain/entities/user.dart';
import 'package:todo_flutter_hybrid/features/auth/domain/usecases/login.dart';
import '../../../../helpers/test_helpers.dart';

void main() {
  late Login useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = Login(mockRepository);
  });

  group('Login', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';
    final tUser = User(
      id: '1',
      email: tEmail,
      name: 'Test User',
      token: 'test_token',
      createdAt: DateTime(2024, 1, 1),
    );

    test('should login user through repository when successful', () async {
      // arrange
      when(
        () => mockRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => Right(tUser));

      // act
      final result = await useCase(email: tEmail, password: tPassword);

      // assert
      expect(result, Right(tUser));
      verify(
        () => mockRepository.login(email: tEmail, password: tPassword),
      ).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return ServerFailure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Invalid credentials');
      when(
        () => mockRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(email: tEmail, password: tPassword);

      // assert
      expect(result, const Left(tFailure));
      verify(
        () => mockRepository.login(email: tEmail, password: tPassword),
      ).called(1);
    });

    test('should return NetworkFailure when no internet', () async {
      // arrange
      const tFailure = NetworkFailure('No internet connection');
      when(
        () => mockRepository.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(email: tEmail, password: tPassword);

      // assert
      expect(result, const Left(tFailure));
    });
  });
}
