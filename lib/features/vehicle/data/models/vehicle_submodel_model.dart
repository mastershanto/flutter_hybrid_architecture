import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_submodel.dart';

part 'vehicle_submodel_model.freezed.dart';
part 'vehicle_submodel_model.g.dart';

@freezed
class VehicleSubModelModel with _$VehicleSubModelModel {
  const VehicleSubModelModel._();

  const factory VehicleSubModelModel({
    required int id,
    required String name,
    int? modelId,
  }) = _VehicleSubModelModel;

  factory VehicleSubModelModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleSubModelModelFromJson(json);

  VehicleSubModel toEntity() =>
      VehicleSubModel(id: id, name: name, modelId: modelId);
}
