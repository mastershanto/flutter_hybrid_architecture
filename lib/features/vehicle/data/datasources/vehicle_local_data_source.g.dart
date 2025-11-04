// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_local_data_source.dart';

// ignore_for_file: type=lint
class $VehicleCategoriesTable extends VehicleCategories
    with TableInfo<$VehicleCategoriesTable, VehicleCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $VehicleCategoriesTable createAlias(String alias) {
    return $VehicleCategoriesTable(attachedDatabase, alias);
  }
}

class VehicleCategory extends DataClass implements Insertable<VehicleCategory> {
  final int id;
  final String name;
  final String? description;
  final String? imageUrl;
  const VehicleCategory({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  VehicleCategoriesCompanion toCompanion(bool nullToAbsent) {
    return VehicleCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory VehicleCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  VehicleCategory copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
  }) => VehicleCategory(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  VehicleCategory copyWithCompanion(VehicleCategoriesCompanion data) {
    return VehicleCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl);
}

class VehicleCategoriesCompanion extends UpdateCompanion<VehicleCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> imageUrl;
  const VehicleCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  VehicleCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  VehicleCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? imageUrl,
  }) {
    return VehicleCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $VehicleBrandsTable extends VehicleBrands
    with TableInfo<$VehicleBrandsTable, VehicleBrand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleBrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, logoUrl, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_brands';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleBrand> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleBrand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleBrand(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
    );
  }

  @override
  $VehicleBrandsTable createAlias(String alias) {
    return $VehicleBrandsTable(attachedDatabase, alias);
  }
}

class VehicleBrand extends DataClass implements Insertable<VehicleBrand> {
  final int id;
  final String name;
  final String? logoUrl;
  final int? categoryId;
  const VehicleBrand({
    required this.id,
    required this.name,
    this.logoUrl,
    this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  VehicleBrandsCompanion toCompanion(bool nullToAbsent) {
    return VehicleBrandsCompanion(
      id: Value(id),
      name: Value(name),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory VehicleBrand.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleBrand(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'categoryId': serializer.toJson<int?>(categoryId),
    };
  }

  VehicleBrand copyWith({
    int? id,
    String? name,
    Value<String?> logoUrl = const Value.absent(),
    Value<int?> categoryId = const Value.absent(),
  }) => VehicleBrand(
    id: id ?? this.id,
    name: name ?? this.name,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
  );
  VehicleBrand copyWithCompanion(VehicleBrandsCompanion data) {
    return VehicleBrand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleBrand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, logoUrl, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleBrand &&
          other.id == this.id &&
          other.name == this.name &&
          other.logoUrl == this.logoUrl &&
          other.categoryId == this.categoryId);
}

class VehicleBrandsCompanion extends UpdateCompanion<VehicleBrand> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> logoUrl;
  final Value<int?> categoryId;
  const VehicleBrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  VehicleBrandsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.logoUrl = const Value.absent(),
    this.categoryId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleBrand> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? logoUrl,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  VehicleBrandsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? logoUrl,
    Value<int?>? categoryId,
  }) {
    return VehicleBrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleBrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $VehicleModelsTable extends VehicleModels
    with TableInfo<$VehicleModelsTable, VehicleModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandIdMeta = const VerificationMeta(
    'brandId',
  );
  @override
  late final GeneratedColumn<int> brandId = GeneratedColumn<int>(
    'brand_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, brandId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand_id')) {
      context.handle(
        _brandIdMeta,
        brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brandId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}brand_id'],
      ),
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
    );
  }

  @override
  $VehicleModelsTable createAlias(String alias) {
    return $VehicleModelsTable(attachedDatabase, alias);
  }
}

class VehicleModel extends DataClass implements Insertable<VehicleModel> {
  final int id;
  final String name;
  final int? brandId;
  final int? categoryId;
  const VehicleModel({
    required this.id,
    required this.name,
    this.brandId,
    this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || brandId != null) {
      map['brand_id'] = Variable<int>(brandId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  VehicleModelsCompanion toCompanion(bool nullToAbsent) {
    return VehicleModelsCompanion(
      id: Value(id),
      name: Value(name),
      brandId: brandId == null && nullToAbsent
          ? const Value.absent()
          : Value(brandId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory VehicleModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      brandId: serializer.fromJson<int?>(json['brandId']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'brandId': serializer.toJson<int?>(brandId),
      'categoryId': serializer.toJson<int?>(categoryId),
    };
  }

  VehicleModel copyWith({
    int? id,
    String? name,
    Value<int?> brandId = const Value.absent(),
    Value<int?> categoryId = const Value.absent(),
  }) => VehicleModel(
    id: id ?? this.id,
    name: name ?? this.name,
    brandId: brandId.present ? brandId.value : this.brandId,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
  );
  VehicleModel copyWithCompanion(VehicleModelsCompanion data) {
    return VehicleModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brandId: $brandId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, brandId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.brandId == this.brandId &&
          other.categoryId == this.categoryId);
}

class VehicleModelsCompanion extends UpdateCompanion<VehicleModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> brandId;
  final Value<int?> categoryId;
  const VehicleModelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.brandId = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  VehicleModelsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.brandId = const Value.absent(),
    this.categoryId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? brandId,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  VehicleModelsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? brandId,
    Value<int?>? categoryId,
  }) {
    return VehicleModelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      brandId: brandId ?? this.brandId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<int>(brandId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleModelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brandId: $brandId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $VehicleSubModelsTable extends VehicleSubModels
    with TableInfo<$VehicleSubModelsTable, VehicleSubModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleSubModelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelIdMeta = const VerificationMeta(
    'modelId',
  );
  @override
  late final GeneratedColumn<int> modelId = GeneratedColumn<int>(
    'model_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, modelId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_sub_models';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleSubModel> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('model_id')) {
      context.handle(
        _modelIdMeta,
        modelId.isAcceptableOrUnknown(data['model_id']!, _modelIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleSubModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleSubModel(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      modelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}model_id'],
      ),
    );
  }

  @override
  $VehicleSubModelsTable createAlias(String alias) {
    return $VehicleSubModelsTable(attachedDatabase, alias);
  }
}

class VehicleSubModel extends DataClass implements Insertable<VehicleSubModel> {
  final int id;
  final String name;
  final int? modelId;
  const VehicleSubModel({required this.id, required this.name, this.modelId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || modelId != null) {
      map['model_id'] = Variable<int>(modelId);
    }
    return map;
  }

  VehicleSubModelsCompanion toCompanion(bool nullToAbsent) {
    return VehicleSubModelsCompanion(
      id: Value(id),
      name: Value(name),
      modelId: modelId == null && nullToAbsent
          ? const Value.absent()
          : Value(modelId),
    );
  }

  factory VehicleSubModel.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleSubModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      modelId: serializer.fromJson<int?>(json['modelId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'modelId': serializer.toJson<int?>(modelId),
    };
  }

  VehicleSubModel copyWith({
    int? id,
    String? name,
    Value<int?> modelId = const Value.absent(),
  }) => VehicleSubModel(
    id: id ?? this.id,
    name: name ?? this.name,
    modelId: modelId.present ? modelId.value : this.modelId,
  );
  VehicleSubModel copyWithCompanion(VehicleSubModelsCompanion data) {
    return VehicleSubModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      modelId: data.modelId.present ? data.modelId.value : this.modelId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleSubModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('modelId: $modelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, modelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleSubModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.modelId == this.modelId);
}

class VehicleSubModelsCompanion extends UpdateCompanion<VehicleSubModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> modelId;
  const VehicleSubModelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.modelId = const Value.absent(),
  });
  VehicleSubModelsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.modelId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleSubModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? modelId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (modelId != null) 'model_id': modelId,
    });
  }

  VehicleSubModelsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? modelId,
  }) {
    return VehicleSubModelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      modelId: modelId ?? this.modelId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (modelId.present) {
      map['model_id'] = Variable<int>(modelId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleSubModelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('modelId: $modelId')
          ..write(')'))
        .toString();
  }
}

class $VehicleConditionsTable extends VehicleConditions
    with TableInfo<$VehicleConditionsTable, VehicleCondition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleConditionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_conditions';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleCondition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleCondition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleCondition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $VehicleConditionsTable createAlias(String alias) {
    return $VehicleConditionsTable(attachedDatabase, alias);
  }
}

class VehicleCondition extends DataClass
    implements Insertable<VehicleCondition> {
  final int id;
  final String name;
  final String? description;
  const VehicleCondition({
    required this.id,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  VehicleConditionsCompanion toCompanion(bool nullToAbsent) {
    return VehicleConditionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory VehicleCondition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleCondition(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  VehicleCondition copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => VehicleCondition(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  VehicleCondition copyWithCompanion(VehicleConditionsCompanion data) {
    return VehicleCondition(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleCondition(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleCondition &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class VehicleConditionsCompanion extends UpdateCompanion<VehicleCondition> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const VehicleConditionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  VehicleConditionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleCondition> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  VehicleConditionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return VehicleConditionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleConditionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $VehicleColorsTable extends VehicleColors
    with TableInfo<$VehicleColorsTable, VehicleColor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleColorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hexCodeMeta = const VerificationMeta(
    'hexCode',
  );
  @override
  late final GeneratedColumn<String> hexCode = GeneratedColumn<String>(
    'hex_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, hexCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_colors';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleColor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('hex_code')) {
      context.handle(
        _hexCodeMeta,
        hexCode.isAcceptableOrUnknown(data['hex_code']!, _hexCodeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleColor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleColor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      hexCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hex_code'],
      ),
    );
  }

  @override
  $VehicleColorsTable createAlias(String alias) {
    return $VehicleColorsTable(attachedDatabase, alias);
  }
}

class VehicleColor extends DataClass implements Insertable<VehicleColor> {
  final int id;
  final String name;
  final String? hexCode;
  const VehicleColor({required this.id, required this.name, this.hexCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || hexCode != null) {
      map['hex_code'] = Variable<String>(hexCode);
    }
    return map;
  }

  VehicleColorsCompanion toCompanion(bool nullToAbsent) {
    return VehicleColorsCompanion(
      id: Value(id),
      name: Value(name),
      hexCode: hexCode == null && nullToAbsent
          ? const Value.absent()
          : Value(hexCode),
    );
  }

  factory VehicleColor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleColor(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      hexCode: serializer.fromJson<String?>(json['hexCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'hexCode': serializer.toJson<String?>(hexCode),
    };
  }

  VehicleColor copyWith({
    int? id,
    String? name,
    Value<String?> hexCode = const Value.absent(),
  }) => VehicleColor(
    id: id ?? this.id,
    name: name ?? this.name,
    hexCode: hexCode.present ? hexCode.value : this.hexCode,
  );
  VehicleColor copyWithCompanion(VehicleColorsCompanion data) {
    return VehicleColor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      hexCode: data.hexCode.present ? data.hexCode.value : this.hexCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleColor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, hexCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleColor &&
          other.id == this.id &&
          other.name == this.name &&
          other.hexCode == this.hexCode);
}

class VehicleColorsCompanion extends UpdateCompanion<VehicleColor> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> hexCode;
  const VehicleColorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.hexCode = const Value.absent(),
  });
  VehicleColorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.hexCode = const Value.absent(),
  }) : name = Value(name);
  static Insertable<VehicleColor> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? hexCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (hexCode != null) 'hex_code': hexCode,
    });
  }

  VehicleColorsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? hexCode,
  }) {
    return VehicleColorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hexCode.present) {
      map['hex_code'] = Variable<String>(hexCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleColorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$VehicleLocalDataSource extends GeneratedDatabase {
  _$VehicleLocalDataSource(QueryExecutor e) : super(e);
  $VehicleLocalDataSourceManager get managers =>
      $VehicleLocalDataSourceManager(this);
  late final $VehicleCategoriesTable vehicleCategories =
      $VehicleCategoriesTable(this);
  late final $VehicleBrandsTable vehicleBrands = $VehicleBrandsTable(this);
  late final $VehicleModelsTable vehicleModels = $VehicleModelsTable(this);
  late final $VehicleSubModelsTable vehicleSubModels = $VehicleSubModelsTable(
    this,
  );
  late final $VehicleConditionsTable vehicleConditions =
      $VehicleConditionsTable(this);
  late final $VehicleColorsTable vehicleColors = $VehicleColorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehicleCategories,
    vehicleBrands,
    vehicleModels,
    vehicleSubModels,
    vehicleConditions,
    vehicleColors,
  ];
}

typedef $$VehicleCategoriesTableCreateCompanionBuilder =
    VehicleCategoriesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<String?> imageUrl,
    });
typedef $$VehicleCategoriesTableUpdateCompanionBuilder =
    VehicleCategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> imageUrl,
    });

class $$VehicleCategoriesTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleCategoriesTable> {
  $$VehicleCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleCategoriesTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleCategoriesTable> {
  $$VehicleCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleCategoriesTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleCategoriesTable> {
  $$VehicleCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$VehicleCategoriesTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleCategoriesTable,
          VehicleCategory,
          $$VehicleCategoriesTableFilterComposer,
          $$VehicleCategoriesTableOrderingComposer,
          $$VehicleCategoriesTableAnnotationComposer,
          $$VehicleCategoriesTableCreateCompanionBuilder,
          $$VehicleCategoriesTableUpdateCompanionBuilder,
          (
            VehicleCategory,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleCategoriesTable,
              VehicleCategory
            >,
          ),
          VehicleCategory,
          PrefetchHooks Function()
        > {
  $$VehicleCategoriesTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => VehicleCategoriesCompanion(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => VehicleCategoriesCompanion.insert(
                id: id,
                name: name,
                description: description,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleCategoriesTable,
      VehicleCategory,
      $$VehicleCategoriesTableFilterComposer,
      $$VehicleCategoriesTableOrderingComposer,
      $$VehicleCategoriesTableAnnotationComposer,
      $$VehicleCategoriesTableCreateCompanionBuilder,
      $$VehicleCategoriesTableUpdateCompanionBuilder,
      (
        VehicleCategory,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleCategoriesTable,
          VehicleCategory
        >,
      ),
      VehicleCategory,
      PrefetchHooks Function()
    >;
typedef $$VehicleBrandsTableCreateCompanionBuilder =
    VehicleBrandsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> logoUrl,
      Value<int?> categoryId,
    });
typedef $$VehicleBrandsTableUpdateCompanionBuilder =
    VehicleBrandsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> logoUrl,
      Value<int?> categoryId,
    });

class $$VehicleBrandsTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleBrandsTable> {
  $$VehicleBrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleBrandsTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleBrandsTable> {
  $$VehicleBrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleBrandsTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleBrandsTable> {
  $$VehicleBrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );
}

class $$VehicleBrandsTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleBrandsTable,
          VehicleBrand,
          $$VehicleBrandsTableFilterComposer,
          $$VehicleBrandsTableOrderingComposer,
          $$VehicleBrandsTableAnnotationComposer,
          $$VehicleBrandsTableCreateCompanionBuilder,
          $$VehicleBrandsTableUpdateCompanionBuilder,
          (
            VehicleBrand,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleBrandsTable,
              VehicleBrand
            >,
          ),
          VehicleBrand,
          PrefetchHooks Function()
        > {
  $$VehicleBrandsTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleBrandsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleBrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleBrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleBrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => VehicleBrandsCompanion(
                id: id,
                name: name,
                logoUrl: logoUrl,
                categoryId: categoryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> logoUrl = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => VehicleBrandsCompanion.insert(
                id: id,
                name: name,
                logoUrl: logoUrl,
                categoryId: categoryId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleBrandsTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleBrandsTable,
      VehicleBrand,
      $$VehicleBrandsTableFilterComposer,
      $$VehicleBrandsTableOrderingComposer,
      $$VehicleBrandsTableAnnotationComposer,
      $$VehicleBrandsTableCreateCompanionBuilder,
      $$VehicleBrandsTableUpdateCompanionBuilder,
      (
        VehicleBrand,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleBrandsTable,
          VehicleBrand
        >,
      ),
      VehicleBrand,
      PrefetchHooks Function()
    >;
typedef $$VehicleModelsTableCreateCompanionBuilder =
    VehicleModelsCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> brandId,
      Value<int?> categoryId,
    });
typedef $$VehicleModelsTableUpdateCompanionBuilder =
    VehicleModelsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> brandId,
      Value<int?> categoryId,
    });

class $$VehicleModelsTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleModelsTable> {
  $$VehicleModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get brandId => $composableBuilder(
    column: $table.brandId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleModelsTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleModelsTable> {
  $$VehicleModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get brandId => $composableBuilder(
    column: $table.brandId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleModelsTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleModelsTable> {
  $$VehicleModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get brandId =>
      $composableBuilder(column: $table.brandId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );
}

class $$VehicleModelsTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleModelsTable,
          VehicleModel,
          $$VehicleModelsTableFilterComposer,
          $$VehicleModelsTableOrderingComposer,
          $$VehicleModelsTableAnnotationComposer,
          $$VehicleModelsTableCreateCompanionBuilder,
          $$VehicleModelsTableUpdateCompanionBuilder,
          (
            VehicleModel,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleModelsTable,
              VehicleModel
            >,
          ),
          VehicleModel,
          PrefetchHooks Function()
        > {
  $$VehicleModelsTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> brandId = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => VehicleModelsCompanion(
                id: id,
                name: name,
                brandId: brandId,
                categoryId: categoryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> brandId = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => VehicleModelsCompanion.insert(
                id: id,
                name: name,
                brandId: brandId,
                categoryId: categoryId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleModelsTable,
      VehicleModel,
      $$VehicleModelsTableFilterComposer,
      $$VehicleModelsTableOrderingComposer,
      $$VehicleModelsTableAnnotationComposer,
      $$VehicleModelsTableCreateCompanionBuilder,
      $$VehicleModelsTableUpdateCompanionBuilder,
      (
        VehicleModel,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleModelsTable,
          VehicleModel
        >,
      ),
      VehicleModel,
      PrefetchHooks Function()
    >;
typedef $$VehicleSubModelsTableCreateCompanionBuilder =
    VehicleSubModelsCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> modelId,
    });
typedef $$VehicleSubModelsTableUpdateCompanionBuilder =
    VehicleSubModelsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> modelId,
    });

class $$VehicleSubModelsTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleSubModelsTable> {
  $$VehicleSubModelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleSubModelsTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleSubModelsTable> {
  $$VehicleSubModelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get modelId => $composableBuilder(
    column: $table.modelId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleSubModelsTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleSubModelsTable> {
  $$VehicleSubModelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get modelId =>
      $composableBuilder(column: $table.modelId, builder: (column) => column);
}

class $$VehicleSubModelsTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleSubModelsTable,
          VehicleSubModel,
          $$VehicleSubModelsTableFilterComposer,
          $$VehicleSubModelsTableOrderingComposer,
          $$VehicleSubModelsTableAnnotationComposer,
          $$VehicleSubModelsTableCreateCompanionBuilder,
          $$VehicleSubModelsTableUpdateCompanionBuilder,
          (
            VehicleSubModel,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleSubModelsTable,
              VehicleSubModel
            >,
          ),
          VehicleSubModel,
          PrefetchHooks Function()
        > {
  $$VehicleSubModelsTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleSubModelsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleSubModelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleSubModelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleSubModelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> modelId = const Value.absent(),
              }) => VehicleSubModelsCompanion(
                id: id,
                name: name,
                modelId: modelId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> modelId = const Value.absent(),
              }) => VehicleSubModelsCompanion.insert(
                id: id,
                name: name,
                modelId: modelId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleSubModelsTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleSubModelsTable,
      VehicleSubModel,
      $$VehicleSubModelsTableFilterComposer,
      $$VehicleSubModelsTableOrderingComposer,
      $$VehicleSubModelsTableAnnotationComposer,
      $$VehicleSubModelsTableCreateCompanionBuilder,
      $$VehicleSubModelsTableUpdateCompanionBuilder,
      (
        VehicleSubModel,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleSubModelsTable,
          VehicleSubModel
        >,
      ),
      VehicleSubModel,
      PrefetchHooks Function()
    >;
typedef $$VehicleConditionsTableCreateCompanionBuilder =
    VehicleConditionsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
    });
typedef $$VehicleConditionsTableUpdateCompanionBuilder =
    VehicleConditionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
    });

class $$VehicleConditionsTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleConditionsTable> {
  $$VehicleConditionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleConditionsTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleConditionsTable> {
  $$VehicleConditionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleConditionsTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleConditionsTable> {
  $$VehicleConditionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$VehicleConditionsTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleConditionsTable,
          VehicleCondition,
          $$VehicleConditionsTableFilterComposer,
          $$VehicleConditionsTableOrderingComposer,
          $$VehicleConditionsTableAnnotationComposer,
          $$VehicleConditionsTableCreateCompanionBuilder,
          $$VehicleConditionsTableUpdateCompanionBuilder,
          (
            VehicleCondition,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleConditionsTable,
              VehicleCondition
            >,
          ),
          VehicleCondition,
          PrefetchHooks Function()
        > {
  $$VehicleConditionsTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleConditionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleConditionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleConditionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleConditionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => VehicleConditionsCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
              }) => VehicleConditionsCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleConditionsTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleConditionsTable,
      VehicleCondition,
      $$VehicleConditionsTableFilterComposer,
      $$VehicleConditionsTableOrderingComposer,
      $$VehicleConditionsTableAnnotationComposer,
      $$VehicleConditionsTableCreateCompanionBuilder,
      $$VehicleConditionsTableUpdateCompanionBuilder,
      (
        VehicleCondition,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleConditionsTable,
          VehicleCondition
        >,
      ),
      VehicleCondition,
      PrefetchHooks Function()
    >;
typedef $$VehicleColorsTableCreateCompanionBuilder =
    VehicleColorsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> hexCode,
    });
typedef $$VehicleColorsTableUpdateCompanionBuilder =
    VehicleColorsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> hexCode,
    });

class $$VehicleColorsTableFilterComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleColorsTable> {
  $$VehicleColorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hexCode => $composableBuilder(
    column: $table.hexCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VehicleColorsTableOrderingComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleColorsTable> {
  $$VehicleColorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hexCode => $composableBuilder(
    column: $table.hexCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehicleColorsTableAnnotationComposer
    extends Composer<_$VehicleLocalDataSource, $VehicleColorsTable> {
  $$VehicleColorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get hexCode =>
      $composableBuilder(column: $table.hexCode, builder: (column) => column);
}

class $$VehicleColorsTableTableManager
    extends
        RootTableManager<
          _$VehicleLocalDataSource,
          $VehicleColorsTable,
          VehicleColor,
          $$VehicleColorsTableFilterComposer,
          $$VehicleColorsTableOrderingComposer,
          $$VehicleColorsTableAnnotationComposer,
          $$VehicleColorsTableCreateCompanionBuilder,
          $$VehicleColorsTableUpdateCompanionBuilder,
          (
            VehicleColor,
            BaseReferences<
              _$VehicleLocalDataSource,
              $VehicleColorsTable,
              VehicleColor
            >,
          ),
          VehicleColor,
          PrefetchHooks Function()
        > {
  $$VehicleColorsTableTableManager(
    _$VehicleLocalDataSource db,
    $VehicleColorsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleColorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleColorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleColorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> hexCode = const Value.absent(),
              }) =>
                  VehicleColorsCompanion(id: id, name: name, hexCode: hexCode),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> hexCode = const Value.absent(),
              }) => VehicleColorsCompanion.insert(
                id: id,
                name: name,
                hexCode: hexCode,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VehicleColorsTableProcessedTableManager =
    ProcessedTableManager<
      _$VehicleLocalDataSource,
      $VehicleColorsTable,
      VehicleColor,
      $$VehicleColorsTableFilterComposer,
      $$VehicleColorsTableOrderingComposer,
      $$VehicleColorsTableAnnotationComposer,
      $$VehicleColorsTableCreateCompanionBuilder,
      $$VehicleColorsTableUpdateCompanionBuilder,
      (
        VehicleColor,
        BaseReferences<
          _$VehicleLocalDataSource,
          $VehicleColorsTable,
          VehicleColor
        >,
      ),
      VehicleColor,
      PrefetchHooks Function()
    >;

class $VehicleLocalDataSourceManager {
  final _$VehicleLocalDataSource _db;
  $VehicleLocalDataSourceManager(this._db);
  $$VehicleCategoriesTableTableManager get vehicleCategories =>
      $$VehicleCategoriesTableTableManager(_db, _db.vehicleCategories);
  $$VehicleBrandsTableTableManager get vehicleBrands =>
      $$VehicleBrandsTableTableManager(_db, _db.vehicleBrands);
  $$VehicleModelsTableTableManager get vehicleModels =>
      $$VehicleModelsTableTableManager(_db, _db.vehicleModels);
  $$VehicleSubModelsTableTableManager get vehicleSubModels =>
      $$VehicleSubModelsTableTableManager(_db, _db.vehicleSubModels);
  $$VehicleConditionsTableTableManager get vehicleConditions =>
      $$VehicleConditionsTableTableManager(_db, _db.vehicleConditions);
  $$VehicleColorsTableTableManager get vehicleColors =>
      $$VehicleColorsTableTableManager(_db, _db.vehicleColors);
}
