import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
import 'package:pokedex/other_informations/models/version_group_details_model.dart';
part 'move_model.g.dart';

// class MoveModel extends Equatable {
//   const MoveModel({
//     this.id,
//     this.accuracy,
//     this.power,
//     this.pp,
//     this.priority,
//     this.move,
//     this.damageClass,
//     this.type,
//     this.effectEntries,
//     this.isDownloaded,
//   });
//   final int? id;
//   final int? accuracy;
//   final int? power;
//   final int? pp;
//   final int? priority;
//   final MoveNameModel? move;
//   final String? damageClass;
//   final String? type;
//   final EffectModel? effectEntries;
//   final bool? isDownloaded;
//   @override
//   List<Object?> get props => [
//         id,
//         accuracy,
//         power,
//         pp,
//         priority,
//         move,
//         damageClass,
//         type,
//         effectEntries,
//         isDownloaded
//       ];
//   factory MoveModel.fromMap(Map<String, dynamic> map) {
//     final move = pick(map, 'move').asMapOrEmpty() as Map<String, String>;
//     final name = MoveNameModel.fromJson(move);
//     final url = pick(name, 'url').asStringOrNull();
//     int? id;
//     RegExp regExp = RegExp(r'/(\d+)/$');
//     Match? match = regExp.firstMatch(url!);
//     if (match != null) {
//       id = int.parse(match.group(1)!);
//     } else {}
//     return MoveModel(
//       id: id,
//       move: name,
//     );
//   }
//   Color get generateColorCategory {
//     if (damageClass?.toLowerCase() == 'status') return Colors.grey.shade400;
//     if (damageClass?.toLowerCase() == 'special') {
//       return Colors.blueGrey.shade700;
//     }
//     if (damageClass?.toLowerCase() == 'physical') {
//       return Color.fromARGB(255, 245, 129, 121);
//     }
//     return Colors.white;
//   }
//   MoveModel copyWith({
//     int? id,
//     int? accuracy,
//     int? power,
//     int? pp,
//     int? priority,
//     MoveNameModel? move,
//     String? damageClass,
//     String? type,
//     EffectModel? effectEntries,
//     bool? isDownloaded,
//   }) {
//     return MoveModel(
//       id: id ?? this.id,
//       accuracy: accuracy ?? this.accuracy,
//       power: power ?? this.power,
//       pp: pp ?? this.pp,
//       priority: priority ?? this.priority,
//       move: move ?? this.move,
//       damageClass: damageClass ?? this.damageClass,
//       type: type ?? this.type,
//       effectEntries: effectEntries ?? this.effectEntries,
//       isDownloaded: isDownloaded ?? this.isDownloaded,
//     );
//   }
// }

@JsonSerializable()
class MoveModel {
  int? id;
  int? accuracy;
  int? power;
  int? pp;
  int? priority;
  MoveNameModel? move;
  String? damageClass;
  String? type;
  EffectModel? effectEntries;
  bool? isDownloaded;
  @JsonKey(name: "version_group_details")
  List<VersionGroupDetailsModel>? versionGroupDetailsModel;

  MoveModel({
    this.id,
    this.accuracy,
    this.power,
    this.pp,
    this.priority,
    this.move,
    this.damageClass,
    this.type,
    this.effectEntries,
    this.isDownloaded,
    this.versionGroupDetailsModel,
  });

  static String encode(List<MoveModel> data) {
    return json.encode(data.map((item) => item.toJson()).toList());
  }

  static List<MoveModel> decode(String data) =>
      (json.decode(data) as List<dynamic>)
          .map<MoveModel>((item) => MoveModel.fromJson(item))
          .toList();

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveModelToJson(this);

  Color get generateColorCategory {
    if (damageClass?.toLowerCase() == 'status') return Colors.grey.shade400;
    if (damageClass?.toLowerCase() == 'special') {
      return Colors.blueGrey.shade700;
    }
    if (damageClass?.toLowerCase() == 'physical') {
      return Color.fromARGB(255, 245, 129, 121);
    }
    return Colors.white;
  }

  MoveModel copyWith({
    int? id,
    int? accuracy,
    int? power,
    int? pp,
    int? priority,
    MoveNameModel? move,
    String? damageClass,
    String? type,
    EffectModel? effectEntries,
    bool? isDownloaded,
    List<VersionGroupDetailsModel>? versionGroupDetailsModel,
  }) {
    return MoveModel(
      id: id ?? this.id,
      accuracy: accuracy ?? this.accuracy,
      power: power ?? this.power,
      pp: pp ?? this.pp,
      priority: priority ?? this.priority,
      move: move ?? this.move,
      damageClass: damageClass ?? this.damageClass,
      type: type ?? this.type,
      effectEntries: effectEntries ?? this.effectEntries,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      versionGroupDetailsModel:
          versionGroupDetailsModel ?? this.versionGroupDetailsModel,
    );
  }
}
