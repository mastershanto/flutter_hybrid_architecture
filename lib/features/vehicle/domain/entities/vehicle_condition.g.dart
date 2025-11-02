// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleConditionImpl _$$VehicleConditionImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleConditionImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$VehicleConditionImplToJson(
  _$VehicleConditionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
