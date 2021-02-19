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
