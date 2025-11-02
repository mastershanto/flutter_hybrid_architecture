// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleCategoryModelImpl _$$VehicleCategoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$VehicleCategoryModelImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$$VehicleCategoryModelImplToJson(
  _$VehicleCategoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
};
