// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalContainer _$AnimalContainerFromJson(Map<String, dynamic> json) {
  return AnimalContainer()
    ..type = json['type'] as String
    ..animals = (json['animals'] as List)
            ?.map((e) =>
                e == null ? null : Animal.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [];
}

Map<String, dynamic> _$AnimalContainerToJson(AnimalContainer instance) =>
    <String, dynamic>{
      'type': instance.type,
      'animals': instance.animals?.map((e) => e?.toJson())?.toList(),
    };
