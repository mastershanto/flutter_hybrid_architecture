# Todo Flutter — Hybrid Architecture (Riverpod + BLoC)

A Flutter todo application demonstrating a hybrid architecture that combines **Riverpod** for dependency injection and **BLoC** for state management, with **Drift** for persistence and **Freezed** for immutability.

## 🏗️ Architecture Overview

This project implements Clean Architecture with a hybrid approach:

- **Riverpod** → Dependency injection, repository management, and provider-based DI
- **BLoC** → Feature-specific reactive state management
- **Drift** → Type-safe SQLite database for local persistence
- **Freezed** → Immutable data classes for events and states
- **Clean Architecture** → Domain / Data / Presentation / Core separation

## 📁 Project Structure

```
lib/
├── core/
│   └── error/
│       ├── failures.dart         # Domain-level failure classes
│       └── exceptions.dart       # Data-level exception classes
├── data/
│   ├── datasources/
│   │   └── todo_local_data_source.dart  # Drift database definition
│   ├── models/
│   │   └── todo_model.dart       # Drift model to entity converters
│   └── repositories/
│       └── todo_repository_impl.dart  # Repository implementation
├── domain/
│   ├── entities/
│   │   └── todo.dart            # Core business entities
│   ├── repositories/
│   │   └── todo_repository.dart # Repository interfaces
│   └── usecases/
│       ├── get_todos.dart       # Get all todos use case
│       ├── add_todo.dart        # Add todo use case
│       ├── delete_todo.dart     # Delete todo use case
│       └── toggle_todo.dart     # Toggle todo use case
├── presentation/
│   ├── blocs/
│   │   └── todo/
│   │       ├── todo_bloc.dart   # BLoC implementation
│   │       ├── todo_event.dart  # Freezed events
│   │       └── todo_state.dart  # Freezed states
│   ├── screens/
│   │   ├── home_screen.dart     # Main todo list screen
│   │   └── add_todo_screen.dart # Add new todo screen
│   └── widgets/
│       └── todo_tile.dart       # Todo item widget
├── di.dart                      # Dependency injection setup
└── main.dart                    # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run code generation:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 🔑 Key Features

### 1. Hybrid Architecture Benefits

✅ **Riverpod** handles:
- Dependency injection
- Repository lifecycle management
- BLoC provider management
- Easy testing and mocking

✅ **BLoC** handles:
- Event-driven state management
- Business logic separation
- Reactive UI updates
- Predictable state transitions

### 2. Drift Database

- Type-safe SQL queries
- Compile-time query validation
- Automatic code generation
- Migration support
- Reactive streams

### 3. Freezed Integration

- Immutable data classes
- Pattern matching with `when`/`maybeWhen`
- Copy with functionality
- Union types for events and states
- Automatic code generation

## 📦 Dependencies

### Production Dependencies
- `flutter_riverpod` - State management and DI
- `flutter_bloc` - BLoC pattern implementation
- `drift` - SQLite database wrapper
- `sqlite3_flutter_libs` - SQLite native libraries
- `path_provider` - Path utilities
- `get_it` - Service locator
- `uuid` - UUID generation
- `equatable` - Value equality

### Development Dependencies
- `build_runner` - Code generation tool
- `drift_dev` - Drift code generator
- `freezed` - Data class generator
- `json_serializable` - JSON serialization

## 🔄 Code Generation

This project uses code generation for:

1. **Drift Database Tables** (`*.g.dart`)
2. **Freezed Classes** (`*.freezed.dart`)

When you modify database tables or freezed classes, run:

```bash
# For one-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# For continuous watching (during development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 🎨 Extending the App

### Adding a New Feature

1. **Domain Layer**: Define entity and repository interface
2. **Data Layer**: Implement repository and data sources
3. **Presentation Layer**: Create BLoC with freezed events/states
4. **DI Setup**: Register dependencies in `di.dart`
5. **UI**: Build screens and widgets

### Adding More Features

Consider adding:
- **Categories/Tags** for todos
- **Due dates** and reminders
- **Search and filtering**
- **Themes** (light/dark mode)
- **Multi-language support** with Riverpod
- **Cloud sync** with Firebase or REST API
- **Unit tests** and widget tests

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Drift Documentation](https://drift.simonbinder.eu/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with ❤️ using Flutter, Riverpod, BLoC, Drift, and Freezed**
