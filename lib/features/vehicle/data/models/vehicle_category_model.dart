import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_category.dart';

part 'vehicle_category_model.freezed.dart';
part 'vehicle_category_model.g.dart';

@freezed
class VehicleCategoryModel with _$VehicleCategoryModel {
  const factory VehicleCategoryModel({
    required int id,
    required String name,
    String? description,
    String? imageUrl,
  }) = _VehicleCategoryModel;

  factory VehicleCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryModelFromJson(json);

  VehicleCategory toEntity() => VehicleCategory(
    id: id,
    name: name,
    description: description,
    imageUrl: imageUrl,
  );
}
