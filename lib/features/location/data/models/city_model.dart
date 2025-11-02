import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/city.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const CityModel._();

  const factory CityModel({
    required int id,
    required String name,
    required int countryId,
    String? countryName,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  City toEntity() =>
      City(id: id, name: name, countryId: countryId, countryName: countryName);
}
