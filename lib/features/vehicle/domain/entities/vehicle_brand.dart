import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_brand.freezed.dart';
part 'vehicle_brand.g.dart';

@freezed
class VehicleBrand with _$VehicleBrand {
  const factory VehicleBrand({
    required int id,
    required String name,
    String? logoUrl,
    int? categoryId,
  }) = _VehicleBrand;

  factory VehicleBrand.fromJson(Map<String, dynamic> json) =>
      _$VehicleBrandFromJson(json);
}
