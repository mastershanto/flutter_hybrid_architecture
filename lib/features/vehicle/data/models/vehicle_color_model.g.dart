// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleColorModelImpl _$$VehicleColorModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleColorModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  hexCode: json['hexCode'] as String?,
);

Map<String, dynamic> _$$VehicleColorModelImplToJson(
  _$VehicleColorModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'hexCode': instance.hexCode,
};
