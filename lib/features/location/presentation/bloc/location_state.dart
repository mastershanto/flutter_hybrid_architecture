import 'package:equatable/equatable.dart';
import '../../domain/entities/country.dart';
import '../../domain/entities/city.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class CountriesLoaded extends LocationState {
  final List<Country> countries;
  const CountriesLoaded(this.countries);

  @override
  List<Object?> get props => [countries];
}

class CitiesLoaded extends LocationState {
  final List<City> cities;
  const CitiesLoaded(this.cities);

  @override
  List<Object?> get props => [cities];
}

class LocationError extends LocationState {
  final String message;
  const LocationError(this.message);

  @override
  List<Object?> get props => [message];
}
