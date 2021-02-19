// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return Animal()
    ..name = json['name'] as String
    ..sound = json['sound'] as String;
}

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'name': instance.name,
      'sound': instance.sound,
    };
