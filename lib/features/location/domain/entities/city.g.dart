// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  countryId: (json['countryId'] as num).toInt(),
  countryName: json['countryName'] as String?,
);

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countryId': instance.countryId,
      'countryName': instance.countryName,
    };
