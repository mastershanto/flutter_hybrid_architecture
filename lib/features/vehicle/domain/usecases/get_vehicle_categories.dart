import 'package:dartz/dartz.dart';
import '../entities/vehicle_category.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleCategories {
  final VehicleRepository repository;
  GetVehicleCategories(this.repository);

  Future<Either<Exception, List<VehicleCategory>>> call() {
    return repository.getCategories();
  }
}
