# Contributing to Todo Flutter Hybrid

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Testing Requirements](#testing-requirements)
- [Pull Request Process](#pull-request-process)
- [Architecture Guidelines](#architecture-guidelines)

---

## 🤝 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. Please be respectful and constructive in your interactions.

### Expected Behavior

- ✅ Be respectful and inclusive
- ✅ Provide constructive feedback
- ✅ Focus on what's best for the community
- ✅ Show empathy towards others

### Unacceptable Behavior

- ❌ Harassment or discriminatory language
- ❌ Personal attacks or trolling
- ❌ Publishing others' private information
- ❌ Any conduct which could reasonably be considered inappropriate

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.9.2+
- Dart SDK 3.0.0+
- Git
- IDE (VS Code or Android Studio recommended)

### Initial Setup

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/todo_flutter_hybrid.git
   cd todo_flutter_hybrid
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/mastershanto/todo_flutter_hybrid.git
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

6. **Run tests**
   ```bash
   flutter test
   ```

---

## 🔄 Development Workflow

### Creating a New Feature

1. **Sync with upstream**
   ```bash
   git checkout main
   git pull upstream main
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow the architecture guidelines
   - Write tests for new functionality
   - Update documentation

4. **Run tests and analyze**
   ```bash
   flutter test
   flutter analyze
   flutter format .
   ```

5. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add amazing feature"
   ```

6. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request**
   - Go to GitHub and create a PR from your fork
   - Fill out the PR template
   - Link any related issues

### Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```bash
feat(todo): add filter by priority
fix(auth): resolve token expiration issue
docs(readme): update installation instructions
test(todo): add unit tests for UpdateTodo use case
```

---

## 📐 Coding Standards

### Dart Style Guide

Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

```dart
// ✅ Good
class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}

// ❌ Bad
class todoRepository {
  Future<List<Todo>> get_todos();
}
```

### Naming Conventions

- **Classes**: PascalCase (`TodoBloc`, `UserModel`)
- **Functions**: camelCase (`getTodos`, `addNewTodo`)
- **Variables**: camelCase (`todoList`, `isLoading`)
- **Constants**: lowerCamelCase (`apiBaseUrl`, `maxRetries`)
- **Private members**: prefix with `_` (`_fetchData`, `_isInitialized`)

### File Organization

```
lib/features/feature_name/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── screens/
    └── widgets/
```

### Code Formatting

```bash
# Format all Dart files
flutter format .

# Check formatting without changing files
flutter format --set-exit-if-changed .
```

---

## 🧪 Testing Requirements

### Test Coverage

- **Minimum coverage**: 80% for business logic
- **Required tests**:
  - All use cases (100%)
  - All BLoC/state management (100%)
  - Repository implementations (80%+)
  - Critical UI flows (widget tests)

### Writing Tests

#### Unit Tests

```dart
// test/features/todo/domain/usecases/add_todo_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late AddTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = AddTodo(mockRepository);
  });

  test('should add todo successfully', () async {
    // arrange
    when(() => mockRepository.add(any()))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await useCase(todo);

    // assert
    expect(result, const Right(null));
    verify(() => mockRepository.add(todo)).called(1);
  });
}
```

#### BLoC Tests

```dart
// test/features/todo/presentation/bloc/todo_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';

void main() {
  blocTest<TodoBloc, TodoState>(
    'should emit [loading, loaded] when getTodos succeeds',
    build: () {
      when(() => mockRepository.getTodos())
          .thenAnswer((_) async => Right(tTodoList));
      return TodoBloc(mockRepository);
    },
    act: (bloc) => bloc.add(const TodoEvent.loadTodos()),
    expect: () => [
      const TodoState.loading(),
      TodoState.loaded(todos: tTodoList),
    ],
  );
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/todo/domain/usecases/add_todo_test.dart

# Run with coverage
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🔍 Pull Request Process

### Before Submitting

1. ✅ All tests pass (`flutter test`)
2. ✅ No analysis issues (`flutter analyze`)
3. ✅ Code is formatted (`flutter format .`)
4. ✅ Documentation is updated
5. ✅ CHANGELOG is updated (for significant changes)

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] BLoC tests added/updated
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings generated
- [ ] Tests pass locally
```

### Review Process

1. **Automated Checks**: CI/CD runs tests and analysis
2. **Code Review**: At least one maintainer reviews
3. **Feedback**: Address review comments
4. **Approval**: Maintainer approves PR
5. **Merge**: PR is merged to main branch

---

## 🏗️ Architecture Guidelines

### Clean Architecture Layers

#### Domain Layer (Business Logic)
```dart
// ✅ Pure Dart, no dependencies on Flutter or external packages
class Todo {
  final String id;
  final String title;
  final bool isCompleted;
  
  const Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });
}
```

#### Data Layer (Implementation)
```dart
// ✅ Implements repository interfaces from domain
class TodoRepositoryImpl implements TodoRepository {
  final TodoDatabase localDataSource;
  final TodoRemoteDataSource remoteDataSource;
  
  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    // Implementation
  }
}
```

#### Presentation Layer (UI)
```dart
// ✅ Depends only on domain layer
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;
  
  TodoBloc(this.repository) : super(const TodoState.initial()) {
    on<LoadTodos>(_onLoadTodos);
  }
}
```

### Error Handling

Always use Either pattern for operations that can fail:

```dart
// ✅ Good
Future<Either<Failure, List<Todo>>> getTodos();

// ❌ Bad
Future<List<Todo>> getTodos(); // Can throw exception
```

### State Management

- Use **BLoC** for complex business logic
- Use **Riverpod** for dependency injection
- Always use **Freezed** for immutable states

---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Riverpod](https://riverpod.dev/)

---

## ❓ Questions?

If you have questions:

1. Check existing [Issues](https://github.com/mastershanto/todo_flutter_hybrid/issues)
2. Review [Discussions](https://github.com/mastershanto/todo_flutter_hybrid/discussions)
3. Create a new issue with the `question` label

---

## 🙏 Thank You!

Thank you for contributing to Todo Flutter Hybrid! Your efforts help make this project better for everyone.

---

**Happy Coding! 🚀**
