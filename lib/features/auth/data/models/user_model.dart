import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' as drift;
import '../../domain/entities/user.dart' as entity;
import '../datasources/auth_local_data_source.dart' as local;

part 'user_model.g.dart';

/// User model for JSON serialization and Drift database
@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String name;
  final String? token;
  final String? avatar;
  final String? code;
  final String? phone;
  final String? whatsapp;
  @JsonKey(name: 'country_id')
  final int? countryId;
  @JsonKey(name: 'country_name')
  final String? countryName;
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @JsonKey(name: 'street_address')
  final String? streetAddress;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const UserModel({
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
    this.emailVerified = false,
    this.createdAt,
    this.updatedAt,
  });

  /// From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Convert to domain entity
  entity.User toEntity() {
    return entity.User(
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
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt,
    );
  }

  /// From domain entity
  factory UserModel.fromEntity(entity.User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      token: user.token,
      avatar: user.avatar,
      code: user.code,
      phone: user.phone,
      whatsapp: user.whatsapp,
      countryId: user.countryId,
      countryName: user.countryName,
      cityId: user.cityId,
      cityName: user.cityName,
      postalCode: user.postalCode,
      streetAddress: user.streetAddress,
      emailVerified: user.emailVerified,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }
}

/// Extension to convert Drift User to domain entity
extension DriftUserX on local.User {
  entity.User toEntity() {
    return entity.User(
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
    );
  }
}

/// Extension to convert domain User to UsersCompanion
extension UserEntityX on entity.User {
  local.UsersCompanion toCompanion() {
    return local.UsersCompanion(
      id: drift.Value(id),
      email: drift.Value(email),
      name: drift.Value(name),
      token: drift.Value(token),
      avatar: drift.Value(avatar),
      code: drift.Value(code),
      phone: drift.Value(phone),
      whatsapp: drift.Value(whatsapp),
      countryId: drift.Value(countryId),
      countryName: drift.Value(countryName),
      cityId: drift.Value(cityId),
      cityName: drift.Value(cityName),
      postalCode: drift.Value(postalCode),
      streetAddress: drift.Value(streetAddress),
      emailVerified: drift.Value(emailVerified),
      createdAt: drift.Value(createdAt ?? DateTime.now()),
      updatedAt: drift.Value(updatedAt ?? DateTime.now()),
    );
  }
}
