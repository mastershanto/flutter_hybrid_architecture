// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleConditionModelImpl _$$VehicleConditionModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleConditionModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$VehicleConditionModelImplToJson(
  _$VehicleConditionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
