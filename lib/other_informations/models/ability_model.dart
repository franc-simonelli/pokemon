import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
part 'ability_model.g.dart';

@JsonSerializable()
class AbilityModel {
  int? id;
  MoveNameModel? ability;
  @JsonKey(name: "is_hidden")
  bool? isHidden;
  EffectModel? effectEntries;
  bool? isDownloaded;

  AbilityModel({
    this.id,
    this.ability,
    this.isHidden,
    this.effectEntries,
    this.isDownloaded,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityModelToJson(this);

  AbilityModel copyWith({
    int? id,
    MoveNameModel? ability,
    bool? isHidden,
    EffectModel? effectEntries,
    bool? isDownloaded,
  }) {
    return AbilityModel(
      id: id ?? this.id,
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      effectEntries: effectEntries ?? this.effectEntries,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }
}
