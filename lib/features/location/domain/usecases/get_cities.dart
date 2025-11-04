import 'package:dartz/dartz.dart';
import '../entities/city.dart';
import '../repositories/location_repository.dart';

class GetCities {
  final LocationRepository repository;
  GetCities(this.repository);

  Future<Either<Exception, List<City>>> call({int? countryId}) {
    return repository.getCities(countryId: countryId);
  }
}
