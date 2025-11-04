import 'package:equatable/equatable.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object?> get props => [];
}

class LoadVehicleCategories extends VehicleEvent {}

class LoadVehicleBrands extends VehicleEvent {
  final int? categoryId;
  const LoadVehicleBrands({this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class LoadVehicleModels extends VehicleEvent {
  final int? brandId;
  final int? categoryId;
  const LoadVehicleModels({this.brandId, this.categoryId});

  @override
  List<Object?> get props => [brandId, categoryId];
}

class LoadVehicleSubModels extends VehicleEvent {
  final int? modelId;
  const LoadVehicleSubModels({this.modelId});

  @override
  List<Object?> get props => [modelId];
}

class LoadVehicleConditions extends VehicleEvent {}

class LoadVehicleColors extends VehicleEvent {}
