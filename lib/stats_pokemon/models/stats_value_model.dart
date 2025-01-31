import 'package:freezed_annotation/freezed_annotation.dart';
part 'stats_value_model.g.dart';

@JsonSerializable()
class StatsValueModel {
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  int total;

  StatsValueModel({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
  });

  StatsValueModel copyWith({
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    int? total,
  }) {
    return StatsValueModel(
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
      total: total ?? this.total,
    );
  }

  factory StatsValueModel.fromJson(Map<String, dynamic> json) =>
      _$StatsValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatsValueModelToJson(this);
}
