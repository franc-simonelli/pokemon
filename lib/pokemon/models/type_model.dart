import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'type_model.g.dart';

@JsonSerializable()
class TypeModel {
  String name;
  List<String> weaknesses;
  List<String> resistence;
  List<String> immunity;

  TypeModel({
    required this.name,
    required this.weaknesses,
    required this.resistence,
    required this.immunity,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);

  static String encode(List<TypeModel> data) {
    return json.encode(data.map((type) => type.toJson()).toList());
  }

  static List<TypeModel> decode(String type) =>
      (json.decode(type) as List<dynamic>)
          .map<TypeModel>((item) => TypeModel.fromJson(item))
          .toList();
}
