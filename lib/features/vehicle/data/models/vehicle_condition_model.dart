import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vehicle_condition.dart';

part 'vehicle_condition_model.freezed.dart';
part 'vehicle_condition_model.g.dart';

@freezed
class VehicleConditionModel with _$VehicleConditionModel {
  const VehicleConditionModel._();

  const factory VehicleConditionModel({
    required int id,
    required String name,
    String? description,
  }) = _VehicleConditionModel;

  factory VehicleConditionModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleConditionModelFromJson(json);

  VehicleCondition toEntity() =>
      VehicleCondition(id: id, name: name, description: description);
}
