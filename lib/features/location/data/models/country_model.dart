import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/country.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    required int id,
    required String name,
    String? code,
    String? flagUrl,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Country toEntity() =>
      Country(id: id, name: name, code: code, flagUrl: flagUrl);
}
