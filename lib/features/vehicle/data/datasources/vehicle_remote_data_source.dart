import 'package:dio/dio.dart';
import '../models/vehicle_category_model.dart';
import '../models/vehicle_brand_model.dart';
import '../models/vehicle_model_model.dart';
import '../models/vehicle_submodel_model.dart';
import '../models/vehicle_condition_model.dart';
import '../models/vehicle_color_model.dart';
import '../../domain/entities/vehicle_category.dart';
import '../../domain/entities/vehicle_brand.dart';
import '../../domain/entities/vehicle_model.dart';
import '../../domain/entities/vehicle_submodel.dart';
import '../../domain/entities/vehicle_condition.dart';
import '../../domain/entities/vehicle_color.dart';

class VehicleRemoteDataSource {
  final Dio dio;
  VehicleRemoteDataSource(this.dio);

  Future<List<VehicleCategory>> getCategories() async {
    final response = await dio.get('/vehicle/categories');
    return (response.data as List)
        .map((json) => VehicleCategoryModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<VehicleBrand>> getBrands({int? categoryId}) async {
    final response = await dio.get(
      '/vehicle/brands',
      queryParameters: {if (categoryId != null) 'category_id': categoryId},
    );
    return (response.data as List)
        .map((json) => VehicleBrandModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<VehicleModel>> getModels({int? brandId, int? categoryId}) async {
    final response = await dio.get(
      '/vehicle/models',
      queryParameters: {
        if (brandId != null) 'brand_id': brandId,
        if (categoryId != null) 'category_id': categoryId,
      },
    );
    return (response.data as List)
        .map((json) => VehicleModelModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<VehicleSubModel>> getSubModels({int? modelId}) async {
    final response = await dio.get(
      '/vehicle/submodels',
      queryParameters: {if (modelId != null) 'model_id': modelId},
    );
    return (response.data as List)
        .map((json) => VehicleSubModelModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<VehicleCondition>> getConditions() async {
    final response = await dio.get('/vehicle/conditions');
    return (response.data as List)
        .map((json) => VehicleConditionModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<VehicleColor>> getColors() async {
    final response = await dio.get('/vehicle/colors');
    return (response.data as List)
        .map((json) => VehicleColorModel.fromJson(json).toEntity())
        .toList();
  }
}
