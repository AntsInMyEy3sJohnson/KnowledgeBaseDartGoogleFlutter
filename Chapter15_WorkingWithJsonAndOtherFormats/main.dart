import 'dart:convert';

void main() {
  // Manual parsing
  const doggoJson = '{"name": "doggo", "sound": "woof"}';

  Map<String, dynamic> decoded = jsonDecode(doggoJson);

  print(decoded);

  final doggo = Animal.fromJson(doggoJson);

  print(doggo);
  print(doggo.toJson());
  // Invokes 'toJson()' in the background -- error if not defined
  print(jsonEncode(doggo));

}

class Animal {
  final String name;
  final String sound;

  // Private constructor
  Animal._({this.name, this.sound});

  factory Animal.fromJson(String json) {
    Map<String, dynamic> decoded = jsonDecode(json);
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
