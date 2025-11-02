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
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.token,
    this.createdAt,
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
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  /// From domain entity
  factory UserModel.fromEntity(entity.User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      token: user.token,
      createdAt: user.createdAt,
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
      createdAt: createdAt,
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
      createdAt: drift.Value(createdAt ?? DateTime.now()),
    );
  }
}
