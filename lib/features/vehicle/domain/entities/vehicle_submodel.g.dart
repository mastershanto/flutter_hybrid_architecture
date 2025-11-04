// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_submodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleSubModelImpl _$$VehicleSubModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleSubModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  modelId: (json['modelId'] as num?)?.toInt(),
);

Map<String, dynamic> _$$VehicleSubModelImplToJson(
  _$VehicleSubModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'modelId': instance.modelId,
};
