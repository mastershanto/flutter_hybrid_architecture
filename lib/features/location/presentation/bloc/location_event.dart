import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadCountries extends LocationEvent {}

class LoadCities extends LocationEvent {
  final int? countryId;
  const LoadCities({this.countryId});

  @override
  List<Object?> get props => [countryId];
}
