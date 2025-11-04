import 'package:dartz/dartz.dart';
import '../entities/vehicle_category.dart';
import '../entities/vehicle_brand.dart';
import '../entities/vehicle_model.dart';
import '../entities/vehicle_submodel.dart';
import '../entities/vehicle_condition.dart';
import '../entities/vehicle_color.dart';

abstract class VehicleRepository {
  Future<Either<Exception, List<VehicleCategory>>> getCategories();
  Future<Either<Exception, List<VehicleBrand>>> getBrands({int? categoryId});
  Future<Either<Exception, List<VehicleModel>>> getModels({
    int? brandId,
    int? categoryId,
  });
  Future<Either<Exception, List<VehicleSubModel>>> getSubModels({int? modelId});
  Future<Either<Exception, List<VehicleCondition>>> getConditions();
  Future<Either<Exception, List<VehicleColor>>> getColors();
}
