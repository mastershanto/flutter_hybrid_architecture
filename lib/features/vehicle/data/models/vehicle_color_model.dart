import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_color.dart';

part 'vehicle_color_model.freezed.dart';
part 'vehicle_color_model.g.dart';

@freezed
class VehicleColorModel with _$VehicleColorModel {
  const factory VehicleColorModel({
    required int id,
    required String name,
    String? hexCode,
  }) = _VehicleColorModel;

  factory VehicleColorModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleColorModelFromJson(json);

  VehicleColor toEntity() => VehicleColor(id: id, name: name, hexCode: hexCode);
}
