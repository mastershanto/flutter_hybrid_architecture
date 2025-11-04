import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_submodel.freezed.dart';
part 'vehicle_submodel.g.dart';

@freezed
class VehicleSubModel with _$VehicleSubModel {
  const factory VehicleSubModel({
    required int id,
    required String name,
    int? modelId,
  }) = _VehicleSubModel;

  factory VehicleSubModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleSubModelFromJson(json);
}
