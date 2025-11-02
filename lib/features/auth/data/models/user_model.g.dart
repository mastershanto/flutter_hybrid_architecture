// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  token: json['token'] as String?,
  avatar: json['avatar'] as String?,
  code: json['code'] as String?,
  phone: json['phone'] as String?,
  whatsapp: json['whatsapp'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  countryName: json['country_name'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  cityName: json['city_name'] as String?,
  postalCode: json['postal_code'] as String?,
  streetAddress: json['street_address'] as String?,
  emailVerified: json['email_verified'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'token': instance.token,
  'avatar': instance.avatar,
  'code': instance.code,
  'phone': instance.phone,
  'whatsapp': instance.whatsapp,
  'country_id': instance.countryId,
  'country_name': instance.countryName,
  'city_id': instance.cityId,
  'city_name': instance.cityName,
  'postal_code': instance.postalCode,
  'street_address': instance.streetAddress,
  'email_verified': instance.emailVerified,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
