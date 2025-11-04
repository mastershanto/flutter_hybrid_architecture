import 'package:dartz/dartz.dart';
import '../entities/vehicle_condition.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleConditions {
  final VehicleRepository repository;
  GetVehicleConditions(this.repository);

  Future<Either<Exception, List<VehicleCondition>>> call() {
    return repository.getConditions();
  }
}
