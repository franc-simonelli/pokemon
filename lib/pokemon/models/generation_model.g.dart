// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationModel _$GenerationModelFromJson(Map<String, dynamic> json) =>
    GenerationModel(
      id: json['id'] as String,
      regione: json['regione'] as String,
      pokemons: (json['pokemons'] as List<dynamic>)
          .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenerationModelToJson(GenerationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'regione': instance.regione,
      'pokemons': instance.pokemons,
    };
