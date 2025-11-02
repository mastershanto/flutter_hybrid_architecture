import 'package:dartz/dartz.dart';
import '../entities/vehicle_submodel.dart';
import '../repositories/vehicle_repository.dart';

class GetVehicleSubModels {
  final VehicleRepository repository;
  GetVehicleSubModels(this.repository);

  Future<Either<Exception, List<VehicleSubModel>>> call({int? modelId}) {
    return repository.getSubModels(modelId: modelId);
  }
}
