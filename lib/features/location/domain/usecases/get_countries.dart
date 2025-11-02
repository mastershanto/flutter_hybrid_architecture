import 'package:dartz/dartz.dart';
import '../entities/country.dart';
import '../repositories/location_repository.dart';

class GetCountries {
  final LocationRepository repository;
  GetCountries(this.repository);

  Future<Either<Exception, List<Country>>> call() {
    return repository.getCountries();
  }
}
