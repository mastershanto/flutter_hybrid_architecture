// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleBrandImpl _$$VehicleBrandImplFromJson(Map<String, dynamic> json) =>
    _$VehicleBrandImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VehicleBrandImplToJson(_$VehicleBrandImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'categoryId': instance.categoryId,
    };
