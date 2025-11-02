import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_condition.freezed.dart';
part 'vehicle_condition.g.dart';

@freezed
class VehicleCondition with _$VehicleCondition {
  const factory VehicleCondition({
    required int id,
    required String name,
    String? description,
  }) = _VehicleCondition;

  factory VehicleCondition.fromJson(Map<String, dynamic> json) =>
      _$VehicleConditionFromJson(json);
}
