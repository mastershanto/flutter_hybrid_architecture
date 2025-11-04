import 'package:mocktail/mocktail.dart';
import 'package:todo_flutter_hybrid/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_flutter_hybrid/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_flutter_hybrid/core/network/network_info.dart';

/// Mock TodoRepository for testing
class MockTodoRepository extends Mock implements TodoRepository {}

/// Mock AuthRepository for testing
class MockAuthRepository extends Mock implements AuthRepository {}

/// Mock NetworkInfo for testing
class MockNetworkInfo extends Mock implements NetworkInfo {}

/// Register fallback values for mocktail
void registerFallbackValues() {
  // Add fallback values if needed
}
