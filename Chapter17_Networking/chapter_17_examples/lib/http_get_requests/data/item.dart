class Item {
  final int id;
  final String title;

  Item({this.id, this.title});

  factory Item.fromJson(Map<String, dynamic> jsonString) {
    return Item(
      id: jsonString['id'] as int,
      title: jsonString['title'] as String,
    );
  }
}
