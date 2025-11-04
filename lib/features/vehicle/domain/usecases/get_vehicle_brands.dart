import 'package:dartz/dartz.dart';
import '../entities/vehicle_brand.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleBrands {
  final VehicleRepository repository;
  GetVehicleBrands(this.repository);

  Future<Either<Exception, List<VehicleBrand>>> call({int? categoryId}) {
    return repository.getBrands(categoryId: categoryId);
  }
}
