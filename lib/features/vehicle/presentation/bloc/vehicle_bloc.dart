import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_vehicle_categories.dart';
import '../../domain/usecases/get_vehicle_brands.dart';
import '../../domain/usecases/get_vehicle_models.dart';
import '../../domain/usecases/get_vehicle_submodels.dart';
import '../../domain/usecases/get_vehicle_conditions.dart';
import '../../domain/usecases/get_vehicle_colors.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final GetVehicleCategories getCategories;
  final GetVehicleBrands getBrands;
  final GetVehicleModels getModels;
  final GetVehicleSubModels getSubModels;
  final GetVehicleConditions getConditions;
  final GetVehicleColors getColors;

  VehicleBloc({
    required this.getCategories,
    required this.getBrands,
    required this.getModels,
    required this.getSubModels,
    required this.getConditions,
    required this.getColors,
  }) : super(VehicleInitial()) {
    on<LoadVehicleCategories>(_onLoadCategories);
    on<LoadVehicleBrands>(_onLoadBrands);
    on<LoadVehicleModels>(_onLoadModels);
    on<LoadVehicleSubModels>(_onLoadSubModels);
    on<LoadVehicleConditions>(_onLoadConditions);
    on<LoadVehicleColors>(_onLoadColors);
  }

  Future<void> _onLoadCategories(
    LoadVehicleCategories event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getCategories();
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (categories) => emit(VehicleCategoriesLoaded(categories)),
    );
  }

  Future<void> _onLoadBrands(
    LoadVehicleBrands event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getBrands(categoryId: event.categoryId);
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (brands) => emit(VehicleBrandsLoaded(brands)),
    );
  }

  Future<void> _onLoadModels(
    LoadVehicleModels event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getModels(
      brandId: event.brandId,
      categoryId: event.categoryId,
    );
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (models) => emit(VehicleModelsLoaded(models)),
    );
  }

  Future<void> _onLoadSubModels(
    LoadVehicleSubModels event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getSubModels(modelId: event.modelId);
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (subModels) => emit(VehicleSubModelsLoaded(subModels)),
    );
  }

  Future<void> _onLoadConditions(
    LoadVehicleConditions event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getConditions();
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (conditions) => emit(VehicleConditionsLoaded(conditions)),
    );
  }

  Future<void> _onLoadColors(
    LoadVehicleColors event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    final result = await getColors();
    result.fold(
      (error) => emit(VehicleError(error.toString())),
      (colors) => emit(VehicleColorsLoaded(colors)),
    );
  }
}
