// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_local_data_source.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
    'token',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
    'avatar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _whatsappMeta = const VerificationMeta(
    'whatsapp',
  );
  @override
  late final GeneratedColumn<String> whatsapp = GeneratedColumn<String>(
    'whatsapp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryIdMeta = const VerificationMeta(
    'countryId',
  );
  @override
  late final GeneratedColumn<int> countryId = GeneratedColumn<int>(
    'country_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryNameMeta = const VerificationMeta(
    'countryName',
  );
  @override
  late final GeneratedColumn<String> countryName = GeneratedColumn<String>(
    'country_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityIdMeta = const VerificationMeta('cityId');
  @override
  late final GeneratedColumn<int> cityId = GeneratedColumn<int>(
    'city_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityNameMeta = const VerificationMeta(
    'cityName',
  );
  @override
  late final GeneratedColumn<String> cityName = GeneratedColumn<String>(
    'city_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postalCodeMeta = const VerificationMeta(
    'postalCode',
  );
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
    'postal_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _streetAddressMeta = const VerificationMeta(
    'streetAddress',
  );
  @override
  late final GeneratedColumn<String> streetAddress = GeneratedColumn<String>(
    'street_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailVerifiedMeta = const VerificationMeta(
    'emailVerified',
  );
  @override
  late final GeneratedColumn<bool> emailVerified = GeneratedColumn<bool>(
    'email_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("email_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    name,
    token,
    avatar,
    code,
    phone,
    whatsapp,
    countryId,
    countryName,
    cityId,
    cityName,
    postalCode,
    streetAddress,
    emailVerified,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
        _tokenMeta,
        token.isAcceptableOrUnknown(data['token']!, _tokenMeta),
      );
    }
    if (data.containsKey('avatar')) {
      context.handle(
        _avatarMeta,
        avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('whatsapp')) {
      context.handle(
        _whatsappMeta,
        whatsapp.isAcceptableOrUnknown(data['whatsapp']!, _whatsappMeta),
      );
    }
    if (data.containsKey('country_id')) {
      context.handle(
        _countryIdMeta,
        countryId.isAcceptableOrUnknown(data['country_id']!, _countryIdMeta),
      );
    }
    if (data.containsKey('country_name')) {
      context.handle(
        _countryNameMeta,
        countryName.isAcceptableOrUnknown(
          data['country_name']!,
          _countryNameMeta,
        ),
      );
    }
    if (data.containsKey('city_id')) {
      context.handle(
        _cityIdMeta,
        cityId.isAcceptableOrUnknown(data['city_id']!, _cityIdMeta),
      );
    }
    if (data.containsKey('city_name')) {
      context.handle(
        _cityNameMeta,
        cityName.isAcceptableOrUnknown(data['city_name']!, _cityNameMeta),
      );
    }
    if (data.containsKey('postal_code')) {
      context.handle(
        _postalCodeMeta,
        postalCode.isAcceptableOrUnknown(data['postal_code']!, _postalCodeMeta),
      );
    }
    if (data.containsKey('street_address')) {
      context.handle(
        _streetAddressMeta,
        streetAddress.isAcceptableOrUnknown(
          data['street_address']!,
          _streetAddressMeta,
        ),
      );
    }
    if (data.containsKey('email_verified')) {
      context.handle(
        _emailVerifiedMeta,
        emailVerified.isAcceptableOrUnknown(
          data['email_verified']!,
          _emailVerifiedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      token: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}token'],
      ),
      avatar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      whatsapp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}whatsapp'],
      ),
      countryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}country_id'],
      ),
      countryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_name'],
      ),
      cityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}city_id'],
      ),
      cityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_name'],
      ),
      postalCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}postal_code'],
      ),
      streetAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}street_address'],
      ),
      emailVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}email_verified'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String id;
  final String email;
  final String name;
  final String? token;
  final String? avatar;
  final String? code;
  final String? phone;
  final String? whatsapp;
  final int? countryId;
  final String? countryName;
  final int? cityId;
  final String? cityName;
  final String? postalCode;
  final String? streetAddress;
  final bool emailVerified;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const User({
    required this.id,
    required this.email,
    required this.name,
    this.token,
    this.avatar,
    this.code,
    this.phone,
    this.whatsapp,
    this.countryId,
    this.countryName,
    this.cityId,
    this.cityName,
    this.postalCode,
    this.streetAddress,
    required this.emailVerified,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['email'] = Variable<String>(email);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || whatsapp != null) {
      map['whatsapp'] = Variable<String>(whatsapp);
    }
    if (!nullToAbsent || countryId != null) {
      map['country_id'] = Variable<int>(countryId);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String>(countryName);
    }
    if (!nullToAbsent || cityId != null) {
      map['city_id'] = Variable<int>(cityId);
    }
    if (!nullToAbsent || cityName != null) {
      map['city_name'] = Variable<String>(cityName);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || streetAddress != null) {
      map['street_address'] = Variable<String>(streetAddress);
    }
    map['email_verified'] = Variable<bool>(emailVerified);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      name: Value(name),
      token: token == null && nullToAbsent
          ? const Value.absent()
          : Value(token),
      avatar: avatar == null && nullToAbsent
          ? const Value.absent()
          : Value(avatar),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      whatsapp: whatsapp == null && nullToAbsent
          ? const Value.absent()
          : Value(whatsapp),
      countryId: countryId == null && nullToAbsent
          ? const Value.absent()
          : Value(countryId),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      cityId: cityId == null && nullToAbsent
          ? const Value.absent()
          : Value(cityId),
      cityName: cityName == null && nullToAbsent
          ? const Value.absent()
          : Value(cityName),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      streetAddress: streetAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(streetAddress),
      emailVerified: Value(emailVerified),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      token: serializer.fromJson<String?>(json['token']),
      avatar: serializer.fromJson<String?>(json['avatar']),
      code: serializer.fromJson<String?>(json['code']),
      phone: serializer.fromJson<String?>(json['phone']),
      whatsapp: serializer.fromJson<String?>(json['whatsapp']),
      countryId: serializer.fromJson<int?>(json['countryId']),
      countryName: serializer.fromJson<String?>(json['countryName']),
      cityId: serializer.fromJson<int?>(json['cityId']),
      cityName: serializer.fromJson<String?>(json['cityName']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      streetAddress: serializer.fromJson<String?>(json['streetAddress']),
      emailVerified: serializer.fromJson<bool>(json['emailVerified']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'token': serializer.toJson<String?>(token),
      'avatar': serializer.toJson<String?>(avatar),
      'code': serializer.toJson<String?>(code),
      'phone': serializer.toJson<String?>(phone),
      'whatsapp': serializer.toJson<String?>(whatsapp),
      'countryId': serializer.toJson<int?>(countryId),
      'countryName': serializer.toJson<String?>(countryName),
      'cityId': serializer.toJson<int?>(cityId),
      'cityName': serializer.toJson<String?>(cityName),
      'postalCode': serializer.toJson<String?>(postalCode),
      'streetAddress': serializer.toJson<String?>(streetAddress),
      'emailVerified': serializer.toJson<bool>(emailVerified),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    Value<String?> token = const Value.absent(),
    Value<String?> avatar = const Value.absent(),
    Value<String?> code = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> whatsapp = const Value.absent(),
    Value<int?> countryId = const Value.absent(),
    Value<String?> countryName = const Value.absent(),
    Value<int?> cityId = const Value.absent(),
    Value<String?> cityName = const Value.absent(),
    Value<String?> postalCode = const Value.absent(),
    Value<String?> streetAddress = const Value.absent(),
    bool? emailVerified,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    token: token.present ? token.value : this.token,
    avatar: avatar.present ? avatar.value : this.avatar,
    code: code.present ? code.value : this.code,
    phone: phone.present ? phone.value : this.phone,
    whatsapp: whatsapp.present ? whatsapp.value : this.whatsapp,
    countryId: countryId.present ? countryId.value : this.countryId,
    countryName: countryName.present ? countryName.value : this.countryName,
    cityId: cityId.present ? cityId.value : this.cityId,
    cityName: cityName.present ? cityName.value : this.cityName,
    postalCode: postalCode.present ? postalCode.value : this.postalCode,
    streetAddress: streetAddress.present
        ? streetAddress.value
        : this.streetAddress,
    emailVerified: emailVerified ?? this.emailVerified,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      name: data.name.present ? data.name.value : this.name,
      token: data.token.present ? data.token.value : this.token,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
      code: data.code.present ? data.code.value : this.code,
      phone: data.phone.present ? data.phone.value : this.phone,
      whatsapp: data.whatsapp.present ? data.whatsapp.value : this.whatsapp,
      countryId: data.countryId.present ? data.countryId.value : this.countryId,
      countryName: data.countryName.present
          ? data.countryName.value
          : this.countryName,
      cityId: data.cityId.present ? data.cityId.value : this.cityId,
      cityName: data.cityName.present ? data.cityName.value : this.cityName,
      postalCode: data.postalCode.present
          ? data.postalCode.value
          : this.postalCode,
      streetAddress: data.streetAddress.present
          ? data.streetAddress.value
          : this.streetAddress,
      emailVerified: data.emailVerified.present
          ? data.emailVerified.value
          : this.emailVerified,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('token: $token, ')
          ..write('avatar: $avatar, ')
          ..write('code: $code, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('cityId: $cityId, ')
          ..write('cityName: $cityName, ')
          ..write('postalCode: $postalCode, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    name,
    token,
    avatar,
    code,
    phone,
    whatsapp,
    countryId,
    countryName,
    cityId,
    cityName,
    postalCode,
    streetAddress,
    emailVerified,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.email == this.email &&
          other.name == this.name &&
          other.token == this.token &&
          other.avatar == this.avatar &&
          other.code == this.code &&
          other.phone == this.phone &&
          other.whatsapp == this.whatsapp &&
          other.countryId == this.countryId &&
          other.countryName == this.countryName &&
          other.cityId == this.cityId &&
          other.cityName == this.cityName &&
          other.postalCode == this.postalCode &&
          other.streetAddress == this.streetAddress &&
          other.emailVerified == this.emailVerified &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> email;
  final Value<String> name;
  final Value<String?> token;
  final Value<String?> avatar;
  final Value<String?> code;
  final Value<String?> phone;
  final Value<String?> whatsapp;
  final Value<int?> countryId;
  final Value<String?> countryName;
  final Value<int?> cityId;
  final Value<String?> cityName;
  final Value<String?> postalCode;
  final Value<String?> streetAddress;
  final Value<bool> emailVerified;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.token = const Value.absent(),
    this.avatar = const Value.absent(),
    this.code = const Value.absent(),
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.cityId = const Value.absent(),
    this.cityName = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.streetAddress = const Value.absent(),
    this.emailVerified = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String email,
    required String name,
    this.token = const Value.absent(),
    this.avatar = const Value.absent(),
    this.code = const Value.absent(),
    this.phone = const Value.absent(),
    this.whatsapp = const Value.absent(),
    this.countryId = const Value.absent(),
    this.countryName = const Value.absent(),
    this.cityId = const Value.absent(),
    this.cityName = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.streetAddress = const Value.absent(),
    this.emailVerified = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       email = Value(email),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? name,
    Expression<String>? token,
    Expression<String>? avatar,
    Expression<String>? code,
    Expression<String>? phone,
    Expression<String>? whatsapp,
    Expression<int>? countryId,
    Expression<String>? countryName,
    Expression<int>? cityId,
    Expression<String>? cityName,
    Expression<String>? postalCode,
    Expression<String>? streetAddress,
    Expression<bool>? emailVerified,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (token != null) 'token': token,
      if (avatar != null) 'avatar': avatar,
      if (code != null) 'code': code,
      if (phone != null) 'phone': phone,
      if (whatsapp != null) 'whatsapp': whatsapp,
      if (countryId != null) 'country_id': countryId,
      if (countryName != null) 'country_name': countryName,
      if (cityId != null) 'city_id': cityId,
      if (cityName != null) 'city_name': cityName,
      if (postalCode != null) 'postal_code': postalCode,
      if (streetAddress != null) 'street_address': streetAddress,
      if (emailVerified != null) 'email_verified': emailVerified,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? id,
    Value<String>? email,
    Value<String>? name,
    Value<String?>? token,
    Value<String?>? avatar,
    Value<String?>? code,
    Value<String?>? phone,
    Value<String?>? whatsapp,
    Value<int?>? countryId,
    Value<String?>? countryName,
    Value<int?>? cityId,
    Value<String?>? cityName,
    Value<String?>? postalCode,
    Value<String?>? streetAddress,
    Value<bool>? emailVerified,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token,
      avatar: avatar ?? this.avatar,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      postalCode: postalCode ?? this.postalCode,
      streetAddress: streetAddress ?? this.streetAddress,
      emailVerified: emailVerified ?? this.emailVerified,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (whatsapp.present) {
      map['whatsapp'] = Variable<String>(whatsapp.value);
    }
    if (countryId.present) {
      map['country_id'] = Variable<int>(countryId.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (cityId.present) {
      map['city_id'] = Variable<int>(cityId.value);
    }
    if (cityName.present) {
      map['city_name'] = Variable<String>(cityName.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (streetAddress.present) {
      map['street_address'] = Variable<String>(streetAddress.value);
    }
    if (emailVerified.present) {
      map['email_verified'] = Variable<bool>(emailVerified.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('token: $token, ')
          ..write('avatar: $avatar, ')
          ..write('code: $code, ')
          ..write('phone: $phone, ')
          ..write('whatsapp: $whatsapp, ')
          ..write('countryId: $countryId, ')
          ..write('countryName: $countryName, ')
          ..write('cityId: $cityId, ')
          ..write('cityName: $cityName, ')
          ..write('postalCode: $postalCode, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('emailVerified: $emailVerified, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AuthDatabase extends GeneratedDatabase {
  _$AuthDatabase(QueryExecutor e) : super(e);
  $AuthDatabaseManager get managers => $AuthDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String id,
      required String email,
      required String name,
      Value<String?> token,
      Value<String?> avatar,
      Value<String?> code,
      Value<String?> phone,
      Value<String?> whatsapp,
      Value<int?> countryId,
      Value<String?> countryName,
      Value<int?> cityId,
      Value<String?> cityName,
      Value<String?> postalCode,
      Value<String?> streetAddress,
      Value<bool> emailVerified,
      required DateTime createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> id,
      Value<String> email,
      Value<String> name,
      Value<String?> token,
      Value<String?> avatar,
      Value<String?> code,
      Value<String?> phone,
      Value<String?> whatsapp,
      Value<int?> countryId,
      Value<String?> countryName,
      Value<int?> cityId,
      Value<String?> cityName,
      Value<String?> postalCode,
      Value<String?> streetAddress,
      Value<bool> emailVerified,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$UsersTableFilterComposer extends Composer<_$AuthDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get streetAddress => $composableBuilder(
    column: $table.streetAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get emailVerified => $composableBuilder(
    column: $table.emailVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsersTableOrderingComposer
    extends Composer<_$AuthDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get token => $composableBuilder(
    column: $table.token,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatar => $composableBuilder(
    column: $table.avatar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsapp => $composableBuilder(
    column: $table.whatsapp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get countryId => $composableBuilder(
    column: $table.countryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cityId => $composableBuilder(
    column: $table.cityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityName => $composableBuilder(
    column: $table.cityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get streetAddress => $composableBuilder(
    column: $table.streetAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get emailVerified => $composableBuilder(
    column: $table.emailVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AuthDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get whatsapp =>
      $composableBuilder(column: $table.whatsapp, builder: (column) => column);

  GeneratedColumn<int> get countryId =>
      $composableBuilder(column: $table.countryId, builder: (column) => column);

  GeneratedColumn<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cityId =>
      $composableBuilder(column: $table.cityId, builder: (column) => column);

  GeneratedColumn<String> get cityName =>
      $composableBuilder(column: $table.cityName, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get streetAddress => $composableBuilder(
    column: $table.streetAddress,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get emailVerified => $composableBuilder(
    column: $table.emailVerified,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AuthDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, BaseReferences<_$AuthDatabase, $UsersTable, User>),
          User,
          PrefetchHooks Function()
        > {
  $$UsersTableTableManager(_$AuthDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> token = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> whatsapp = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<int?> cityId = const Value.absent(),
                Value<String?> cityName = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> streetAddress = const Value.absent(),
                Value<bool> emailVerified = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                email: email,
                name: name,
                token: token,
                avatar: avatar,
                code: code,
                phone: phone,
                whatsapp: whatsapp,
                countryId: countryId,
                countryName: countryName,
                cityId: cityId,
                cityName: cityName,
                postalCode: postalCode,
                streetAddress: streetAddress,
                emailVerified: emailVerified,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String email,
                required String name,
                Value<String?> token = const Value.absent(),
                Value<String?> avatar = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> whatsapp = const Value.absent(),
                Value<int?> countryId = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<int?> cityId = const Value.absent(),
                Value<String?> cityName = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> streetAddress = const Value.absent(),
                Value<bool> emailVerified = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                email: email,
                name: name,
                token: token,
                avatar: avatar,
                code: code,
                phone: phone,
                whatsapp: whatsapp,
                countryId: countryId,
                countryName: countryName,
                cityId: cityId,
                cityName: cityName,
                postalCode: postalCode,
                streetAddress: streetAddress,
                emailVerified: emailVerified,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AuthDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, BaseReferences<_$AuthDatabase, $UsersTable, User>),
      User,
      PrefetchHooks Function()
    >;

class $AuthDatabaseManager {
  final _$AuthDatabase _db;
  $AuthDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
}
