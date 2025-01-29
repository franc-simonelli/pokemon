// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_group_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionGroupDetailsModel _$VersionGroupDetailsModelFromJson(
        Map<String, dynamic> json) =>
    VersionGroupDetailsModel(
      levelLearnedAt: (json['level_learned_at'] as num?)?.toInt(),
      moveLearnMethod: json['move_learn_method'] == null
          ? null
          : MoveLearnMethod.fromJson(
              json['move_learn_method'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : MoveLearnMethod.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupDetailsModelToJson(
        VersionGroupDetailsModel instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
    };

MoveLearnMethod _$MoveLearnMethodFromJson(Map<String, dynamic> json) =>
    MoveLearnMethod(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MoveLearnMethodToJson(MoveLearnMethod instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
