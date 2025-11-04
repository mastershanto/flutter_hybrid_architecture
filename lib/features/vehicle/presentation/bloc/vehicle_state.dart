import 'package:equatable/equatable.dart';
import '../../domain/entities/vehicle_category.dart';
import '../../domain/entities/vehicle_brand.dart';
import '../../domain/entities/vehicle_model.dart';
import '../../domain/entities/vehicle_submodel.dart';
import '../../domain/entities/vehicle_condition.dart';
import '../../domain/entities/vehicle_color.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object?> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehicleCategoriesLoaded extends VehicleState {
  final List<VehicleCategory> categories;
  const VehicleCategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class VehicleBrandsLoaded extends VehicleState {
  final List<VehicleBrand> brands;
  const VehicleBrandsLoaded(this.brands);

  @override
  List<Object?> get props => [brands];
}

class VehicleModelsLoaded extends VehicleState {
  final List<VehicleModel> models;
  const VehicleModelsLoaded(this.models);

  @override
  List<Object?> get props => [models];
}

class VehicleSubModelsLoaded extends VehicleState {
  final List<VehicleSubModel> subModels;
  const VehicleSubModelsLoaded(this.subModels);

  @override
  List<Object?> get props => [subModels];
}

class VehicleConditionsLoaded extends VehicleState {
  final List<VehicleCondition> conditions;
  const VehicleConditionsLoaded(this.conditions);

  @override
  List<Object?> get props => [conditions];
}

class VehicleColorsLoaded extends VehicleState {
  final List<VehicleColor> colors;
  const VehicleColorsLoaded(this.colors);

  @override
  List<Object?> get props => [colors];
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError(this.message);

  @override
  List<Object?> get props => [message];
}
