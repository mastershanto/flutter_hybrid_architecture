// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleModelModelImpl _$$VehicleModelModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleModelModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  brandId: (json['brandId'] as num?)?.toInt(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
);

Map<String, dynamic> _$$VehicleModelModelImplToJson(
  _$VehicleModelModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'brandId': instance.brandId,
  'categoryId': instance.categoryId,
};
