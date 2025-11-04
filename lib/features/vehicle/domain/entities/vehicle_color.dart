import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_color.freezed.dart';
part 'vehicle_color.g.dart';

@freezed
class VehicleColor with _$VehicleColor {
  const factory VehicleColor({
    required int id,
    required String name,
    String? hexCode,
  }) = _VehicleColor;

  factory VehicleColor.fromJson(Map<String, dynamic> json) =>
      _$VehicleColorFromJson(json);
}
