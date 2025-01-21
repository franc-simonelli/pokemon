import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  int id;
  String description;
  String image;
  EnumGen gen;

  CountryModel({
    required this.id,
    required this.description,
    required this.image,
    required this.gen,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
