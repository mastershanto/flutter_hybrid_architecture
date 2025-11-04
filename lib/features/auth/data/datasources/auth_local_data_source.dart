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
  TextColumn get avatar => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get whatsapp => text().nullable()();
  IntColumn get countryId => integer().nullable()();
  TextColumn get countryName => text().nullable()();
  IntColumn get cityId => integer().nullable()();
  TextColumn get cityName => text().nullable()();
  TextColumn get postalCode => text().nullable()();
  TextColumn get streetAddress => text().nullable()();
  BoolColumn get emailVerified =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Drift database definition for authentication
@DriftDatabase(tables: [Users])
class AuthDatabase extends _$AuthDatabase {
  AuthDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Add new columns for version 2
          await m.addColumn(users, users.avatar as GeneratedColumn);
          await m.addColumn(users, users.code as GeneratedColumn);
          await m.addColumn(users, users.phone as GeneratedColumn);
          await m.addColumn(users, users.whatsapp as GeneratedColumn);
          await m.addColumn(users, users.countryId as GeneratedColumn);
          await m.addColumn(users, users.countryName as GeneratedColumn);
          await m.addColumn(users, users.cityId as GeneratedColumn);
          await m.addColumn(users, users.cityName as GeneratedColumn);
          await m.addColumn(users, users.postalCode as GeneratedColumn);
          await m.addColumn(users, users.streetAddress as GeneratedColumn);
          await m.addColumn(users, users.emailVerified as GeneratedColumn);
          await m.addColumn(users, users.updatedAt as GeneratedColumn);
        }
      },
    );
  }

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
