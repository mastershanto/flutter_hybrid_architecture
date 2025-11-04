import 'package:dio/dio.dart';
import '../models/country_model.dart';
import '../models/city_model.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/city.dart';

class LocationRemoteDataSource {
  final Dio dio;
  LocationRemoteDataSource(this.dio);

  Future<List<Country>> getCountries() async {
    final response = await dio.get('/location/countries');
    return (response.data as List)
        .map((json) => CountryModel.fromJson(json).toEntity())
        .toList();
  }

  Future<List<City>> getCities({int? countryId}) async {
    final response = await dio.get(
      '/location/cities',
      queryParameters: {if (countryId != null) 'country_id': countryId},
    );
    return (response.data as List)
        .map((json) => CityModel.fromJson(json).toEntity())
        .toList();
  }
}
