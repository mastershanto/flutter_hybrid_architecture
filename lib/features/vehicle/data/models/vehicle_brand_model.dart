import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_brand.dart';

part 'vehicle_brand_model.freezed.dart';
part 'vehicle_brand_model.g.dart';

@freezed
class VehicleBrandModel with _$VehicleBrandModel {
  const factory VehicleBrandModel({
    required int id,
    required String name,
    String? logoUrl,
    int? categoryId,
  }) = _VehicleBrandModel;

  factory VehicleBrandModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleBrandModelFromJson(json);
  
  VehicleBrand toEntity() => VehicleBrand(
    id: id,
    name: name,
    logoUrl: logoUrl,
    categoryId: categoryId,
  );
}
