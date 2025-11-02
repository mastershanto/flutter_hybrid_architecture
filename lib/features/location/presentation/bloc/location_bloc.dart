import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_countries.dart';
import '../../domain/usecases/get_cities.dart';
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCountries getCountries;
  final GetCities getCities;

  LocationBloc({required this.getCountries, required this.getCities})
    : super(LocationInitial()) {
    on<LoadCountries>(_onLoadCountries);
    on<LoadCities>(_onLoadCities);
  }

  Future<void> _onLoadCountries(
    LoadCountries event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final result = await getCountries();
    result.fold(
      (error) => emit(LocationError(error.toString())),
      (countries) => emit(CountriesLoaded(countries)),
    );
  }

  Future<void> _onLoadCities(
    LoadCities event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final result = await getCities(countryId: event.countryId);
    result.fold(
      (error) => emit(LocationError(error.toString())),
      (cities) => emit(CitiesLoaded(cities)),
    );
  }
}
