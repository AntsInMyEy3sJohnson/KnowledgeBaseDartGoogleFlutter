import 'package:chapter_16_examples/testing_widgets/person.dart';
import 'package:flutter/material.dart';

class WidgetTest extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int age;

  const WidgetTest(this.firstName, this.lastName, this.age);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Person(firstName, lastName, age),
    );
  }
}

class WidgetTest2 extends StatelessWidget {

  final Icon iconToDisplay;

  const WidgetTest2(this.iconToDisplay);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: iconToDisplay,
      ),
    );
  }

}
