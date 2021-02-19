import 'package:json_annotation/json_annotation.dart';

// Code generator will create this file for us. Because of 'part', we can access
// private members in this file from the class below.
part 'animal.g.dart';

// Tells the code generator that JSON serialization code needs to be generated for
// this class.
// Code generation invoked with:
// $ flutter pub run build_runner build
// Or, to invoke a build automatically whenever a change is made to the class:
// $ flutter pub run build_runner watch
@JsonSerializable()
class Animal {
  String name;
  String sound;

  // For the code generation to work, the class needs a default constructor
  Animal();

  // The '_$' syntax tells the code generator it should generate those methods.
  factory Animal.fromJson(Map<String, dynamic> decoded) => _$AnimalFromJson(decoded);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);

}