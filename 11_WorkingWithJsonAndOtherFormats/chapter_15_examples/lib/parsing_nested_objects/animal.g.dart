// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return Animal()
    ..species = json['species'] as String
    ..sound = json['sound'] as String;
}

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'species': instance.species,
      'sound': instance.sound,
    };
