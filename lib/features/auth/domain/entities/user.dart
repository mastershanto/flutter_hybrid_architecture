import 'package:equatable/equatable.dart';

/// User entity representing authenticated user with complete profile
class User extends Equatable {
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
  final DateTime? createdAt;
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
    this.emailVerified = false,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? token,
    String? avatar,
    String? code,
    String? phone,
    String? whatsapp,
    int? countryId,
    String? countryName,
    int? cityId,
    String? cityName,
    String? postalCode,
    String? streetAddress,
    bool? emailVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
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
    );
  }

  @override
  List<Object?> get props => [
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
}
