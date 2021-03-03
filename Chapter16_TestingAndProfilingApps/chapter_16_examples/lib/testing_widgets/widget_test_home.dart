import 'package:chapter_16_examples/testing_widgets/person.dart';
import 'package:flutter/material.dart';

class WidgetTestHome extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int age;

  const WidgetTestHome(this.firstName, this.lastName, this.age);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Pumped directly in test without MaterialApp specifying
      // text directionality, so text directionality must be
      // explicitly provided
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Person(firstName, lastName, age)),
    );
  }
}
