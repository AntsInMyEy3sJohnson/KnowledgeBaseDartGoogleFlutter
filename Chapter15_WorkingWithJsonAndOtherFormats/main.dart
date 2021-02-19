import 'dart:convert';

void main() {
  // Manual parsing
  const doggoJson = '{"name": "doggo", "sound": "woof"}';

  Map<String, dynamic> decoded = jsonDecode(doggoJson);

  print(decoded);

  final doggo = Animal.fromJson(decoded);

  print(doggo);
  print(doggo.toJson());
  // Invokes 'toJson()' in the background -- error if not defined
  print(jsonEncode(doggo));

  // Parsing lists
  final animalsJson = '''[
        {"name": "doggo", "sound": "woof"},
        {"name": "kitty", "sound": "meow"},
        {"name": "donkey", "sound": "eeeh-aaah"},
        {"name": "programmer", "sound": "where coffee"}
      ]
      ''';
  List<dynamic> animalsJsonList = jsonDecode(animalsJson);

  final List<Animal> animals =
      animalsJsonList.map((e) => Animal.fromJson(e)).toList();
  print(animals);

  // Parsing nested objects
  final nestedAnimalJsons = '''{
    "type": "mammals",
    "animals": [
      {"name": "doggo", "sound": "woof"},
      {"name": "kitty", "sound": "meow"},
      {"name": "donkey", "sound": "eeeh-aaah"},
      {"name": "programmer", "sound": "where coffee"}
    ]
  }
  ''';
  // Parsing logic in here gets more complicated and harder to understand -- despite
  // the fact that the JSON object is not that complex. If we were to build in more
  // nesting levels, the parsing logic would have to grow larger very quickly.
  final animalContainer = AnimalContainer.fromJson(jsonDecode(nestedAnimalJsons));
  print(animalContainer);

}

class AnimalContainer {
  final String type;
  final List<Animal> animals;

  AnimalContainer._({this.type, this.animals});

  factory AnimalContainer.fromJson(Map<String, dynamic> decoded) {
    List<dynamic> animalJsons = decoded['animals'];
    List<Animal> animals = animalJsons.map((e) => Animal.fromJson(e)).toList();

    return AnimalContainer._(
      type: decoded['type'],
      animals: animals,
    );
  }

  @override
  String toString() {
    return 'AnimalContainer{type: $type, animals: $animals}';
  }

}

class Animal {
  final String name;
  final String sound;

  // Private constructor
  Animal._({this.name, this.sound});

  factory Animal.fromJson(Map<String, dynamic> decoded) {
    return Animal._(
      name: decoded['name'],
      sound: decoded['sound'],
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "sound": sound};

  @override
  String toString() {
    return 'Animal{name: $name, sound: $sound}';
  }
}
