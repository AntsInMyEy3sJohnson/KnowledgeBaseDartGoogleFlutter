import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int age;

  const Person(this.firstName, this.lastName, this.age);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstName),
        Text(lastName),
        Text("$age"),
      ],
    );
  }
}
