import 'package:equatable/equatable.dart';

/// User entity representing authenticated user
class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? token;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.token,
    this.createdAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? token,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, email, name, token, createdAt];
}
