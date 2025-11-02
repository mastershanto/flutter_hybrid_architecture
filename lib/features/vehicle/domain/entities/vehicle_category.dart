import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_category.freezed.dart';
part 'vehicle_category.g.dart';

@freezed
class VehicleCategory with _$VehicleCategory {
  const factory VehicleCategory({
    required int id,
    required String name,
    String? description,
    String? imageUrl,
  }) = _VehicleCategory;

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryFromJson(json);
}
