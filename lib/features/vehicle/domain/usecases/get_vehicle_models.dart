import 'package:dartz/dartz.dart';
import '../entities/vehicle_model.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleModels {
  final VehicleRepository repository;
  GetVehicleModels(this.repository);

  Future<Either<Exception, List<VehicleModel>>> call({
    int? brandId,
    int? categoryId,
  }) {
    return repository.getModels(brandId: brandId, categoryId: categoryId);
  }
}
