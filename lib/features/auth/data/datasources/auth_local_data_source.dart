import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'auth_local_data_source.g.dart';

/// Drift table definition for Users
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get name => text()();
  TextColumn get token => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Drift database definition for authentication
@DriftDatabase(tables: [Users])
class AuthDatabase extends _$AuthDatabase {
  AuthDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Get current user (only one user stored locally)
  Future<User?> getCurrentUser() async {
    final users = await select(this.users).get();
    return users.isEmpty ? null : users.first;
  }

  /// Save user
  Future<void> saveUser(UsersCompanion user) async {
    // Clear existing users first (single user app)
    await delete(users).go();
    // Insert new user
    await into(users).insert(user);
  }

  /// Delete current user (logout)
  Future<void> deleteUser() async {
    await delete(users).go();
  }

  /// Check if user exists
  Future<bool> hasUser() async {
    final users = await select(this.users).get();
    return users.isNotEmpty;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'auth.sqlite'));
    return NativeDatabase(file);
  });
}
