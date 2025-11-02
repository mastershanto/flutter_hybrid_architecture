// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleColorImpl _$$VehicleColorImplFromJson(Map<String, dynamic> json) =>
    _$VehicleColorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      hexCode: json['hexCode'] as String?,
    );

Map<String, dynamic> _$$VehicleColorImplToJson(_$VehicleColorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hexCode': instance.hexCode,
    };
