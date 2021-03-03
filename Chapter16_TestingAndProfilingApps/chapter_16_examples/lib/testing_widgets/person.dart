import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  final int age;
  final String firstName;
  final String lastName;

  Person(this.age, this.firstName, this.lastName);

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
