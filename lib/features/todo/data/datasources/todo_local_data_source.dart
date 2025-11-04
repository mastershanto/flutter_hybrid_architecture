import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'todo_local_data_source.g.dart';

/// Drift table definition for Todos
class Todos extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Drift database definition
@DriftDatabase(tables: [Todos])
class TodoDatabase extends _$TodoDatabase {
  TodoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Get all todos
  Future<List<Todo>> getAllTodos() => select(todos).get();

  /// Insert a todo
  Future<int> insertTodo(TodosCompanion todo) => into(todos).insert(todo);

  /// Update a todo
  Future<bool> updateTodo(TodosCompanion todo) => update(todos).replace(todo);

  /// Delete a todo by id
  Future<int> deleteTodoById(String id) =>
      (delete(todos)..where((t) => t.id.equals(id))).go();

  /// Get a todo by id
  Future<Todo?> getTodoById(String id) =>
      (select(todos)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Toggle todo done status
  Future<void> toggleTodo(String id) async {
    final todo = await getTodoById(id);
    if (todo != null) {
      await (update(todos)..where((t) => t.id.equals(id))).write(
        TodosCompanion(done: Value(!todo.done)),
      );
    }
  }

  /// Upsert (insert or update) a todo
  Future<void> upsertTodo(TodosCompanion todo) async {
    await into(todos).insertOnConflictUpdate(todo);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todos.sqlite'));
    return NativeDatabase(file);
  });
}
