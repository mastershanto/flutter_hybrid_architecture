// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_submodel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleSubModelModelImpl _$$VehicleSubModelModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleSubModelModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  modelId: (json['modelId'] as num?)?.toInt(),
);

Map<String, dynamic> _$$VehicleSubModelModelImplToJson(
  _$VehicleSubModelModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'modelId': instance.modelId,
};
