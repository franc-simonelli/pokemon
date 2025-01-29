import 'package:freezed_annotation/freezed_annotation.dart';
part 'version_group_details_model.g.dart';

@JsonSerializable()
class VersionGroupDetailsModel {
  @JsonKey(name: "level_learned_at")
  int? levelLearnedAt;
  @JsonKey(name: "move_learn_method")
  MoveLearnMethod? moveLearnMethod;
  @JsonKey(name: "version_group")
  MoveLearnMethod? versionGroup;

  VersionGroupDetailsModel({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailsModelToJson(this);

  VersionGroupDetailsModel copyWith({
    int? levelLearnedAt,
    MoveLearnMethod? moveLearnMethod,
    MoveLearnMethod? versionGroup,
  }) {
    return VersionGroupDetailsModel(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }
}

@JsonSerializable()
class MoveLearnMethod {
  String? name;
  String? url;

  MoveLearnMethod({
    this.name,
    this.url,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) =>
      _$MoveLearnMethodFromJson(json);

  Map<String, dynamic> toJson() => _$MoveLearnMethodToJson(this);

  MoveLearnMethod copyWith({
    String? name,
    String? url,
  }) {
    return MoveLearnMethod(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
