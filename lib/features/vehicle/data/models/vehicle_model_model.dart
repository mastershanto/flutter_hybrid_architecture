import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_model.dart';

part 'vehicle_model_model.freezed.dart';
part 'vehicle_model_model.g.dart';

@freezed
class VehicleModelModel with _$VehicleModelModel {
  const factory VehicleModelModel({
    required int id,
    required String name,
    int? brandId,
    int? categoryId,
  }) = _VehicleModelModel;

  factory VehicleModelModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelModelFromJson(json);

  VehicleModel toEntity() => VehicleModel(
    id: id,
    name: name,
    brandId: brandId,
    categoryId: categoryId,
  );
}
