import 'package:dartz/dartz.dart';
import '../../domain/entities/vehicle_category.dart';
import '../../domain/entities/vehicle_brand.dart';
import '../../domain/entities/vehicle_model.dart';
import '../../domain/entities/vehicle_submodel.dart';
import '../../domain/entities/vehicle_condition.dart';
import '../../domain/entities/vehicle_color.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../datasources/vehicle_remote_data_source.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleRemoteDataSource remoteDataSource;

  VehicleRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<VehicleCategory>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<VehicleBrand>>> getBrands({
    int? categoryId,
  }) async {
    try {
      final brands = await remoteDataSource.getBrands(categoryId: categoryId);
      return Right(brands);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<VehicleModel>>> getModels({
    int? brandId,
    int? categoryId,
  }) async {
    try {
      final models = await remoteDataSource.getModels(
        brandId: brandId,
        categoryId: categoryId,
      );
      return Right(models);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<VehicleSubModel>>> getSubModels({
    int? modelId,
  }) async {
    try {
      final subModels = await remoteDataSource.getSubModels(modelId: modelId);
      return Right(subModels);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<VehicleCondition>>> getConditions() async {
    try {
      final conditions = await remoteDataSource.getConditions();
      return Right(conditions);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<VehicleColor>>> getColors() async {
    try {
      final colors = await remoteDataSource.getColors();
      return Right(colors);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
