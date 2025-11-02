import 'package:dartz/dartz.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/location_repository.dart';
import '../datasources/location_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<Country>>> getCountries() async {
    try {
      final countries = await remoteDataSource.getCountries();
      return Right(countries);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<City>>> getCities({int? countryId}) async {
    try {
      final cities = await remoteDataSource.getCities(countryId: countryId);
      return Right(cities);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
