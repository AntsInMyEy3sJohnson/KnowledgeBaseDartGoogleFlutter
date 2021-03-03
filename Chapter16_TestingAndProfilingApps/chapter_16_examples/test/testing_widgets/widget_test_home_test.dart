import 'package:chapter_16_examples/main.dart';
import 'package:chapter_16_examples/testing_widgets/person.dart';
import 'package:chapter_16_examples/testing_widgets/widget_test_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test if Person widget display age, first name, and last name.",
      (WidgetTester widgetTester) async {

    const firstName = "Jane";
    const lastName = "Doe";
    const age = 27;

    // Builds and renders a widget in a testing environment.
    // Equivalent of inserting a 'Person' widget into the widget tree of
    // an app and invoking 'build()' to render it.
    await widgetTester.pumpWidget(WidgetTestHome(firstName, lastName, age));

    // Calling 'text()' will try to find a 'Text' widget containing a
    // string that is equal to the given string.
    final firstNameFinder = find.text(firstName);
    final lastNameFinder = find.text(lastName);
    final ageFinder = find.text("$age");

    expect(firstNameFinder, findsOneWidget);
    expect(lastNameFinder, findsOneWidget);
    expect(ageFinder, findsOneWidget);

  });
}
