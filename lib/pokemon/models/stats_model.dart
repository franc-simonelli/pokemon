import 'package:freezed_annotation/freezed_annotation.dart';
part 'stats_model.g.dart';

@JsonSerializable()
class InformationUpdateModel {
  StatsModel? stats;
  int? height;
  int? weight;

  InformationUpdateModel({
    this.stats,
    this.height,
    this.weight,
  });

  factory InformationUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$InformationUpdateModelFromJson(json);

  Map<String, dynamic> toJson() => _$InformationUpdateModelToJson(this);
}

@JsonSerializable()
class StatsModel {
  @JsonKey(name: "base_stat")
  int? baseStat;
  @JsonKey(name: "stat")
  StatModel? stat;

  StatsModel({
    this.baseStat,
    this.stat,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatsModelToJson(this);
}

@JsonSerializable()
class StatModel {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "url")
  String? url;

  StatModel({
    this.name,
    this.url,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) =>
      _$StatModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatModelToJson(this);
}
