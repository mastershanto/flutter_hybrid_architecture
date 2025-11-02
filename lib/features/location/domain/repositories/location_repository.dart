import 'package:dartz/dartz.dart';
import '../entities/country.dart';
import '../entities/city.dart';

abstract class LocationRepository {
  Future<Either<Exception, List<Country>>> getCountries();
  Future<Either<Exception, List<City>>> getCities({int? countryId});
}
