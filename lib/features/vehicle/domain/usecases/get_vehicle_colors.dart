import 'package:dartz/dartz.dart';
import '../entities/vehicle_color.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleColors {
  final VehicleRepository repository;
  GetVehicleColors(this.repository);

  Future<Either<Exception, List<VehicleColor>>> call() {
    return repository.getColors();
  }
}
