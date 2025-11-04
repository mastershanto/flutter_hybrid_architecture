import 'package:drift/drift.dart';

part 'vehicle_local_data_source.g.dart';

class VehicleCategories extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class VehicleBrands extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get logoUrl => text().nullable()();
  IntColumn get categoryId => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class VehicleModels extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get brandId => integer().nullable()();
  IntColumn get categoryId => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class VehicleSubModels extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get modelId => integer().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class VehicleConditions extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

class VehicleColors extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get hexCode => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    VehicleCategories,
    VehicleBrands,
    VehicleModels,
    VehicleSubModels,
    VehicleConditions,
    VehicleColors,
  ],
)
class VehicleLocalDataSource extends _$VehicleLocalDataSource {
  VehicleLocalDataSource(super.e);

  @override
  int get schemaVersion => 1;

  // Add CRUD methods as needed for offline-first support
}
