import 'package:chapter_16_examples/testing_widgets/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test if Person widget display age, first name, and last name.",
      (WidgetTester widgetTester) async {
    const age = 27;
    const firstName = "Jane";
    const lastName = "Doe";

    // Builds and renders a widget in a testing environment.
    // Equivalent of inserting a 'Person' widget into the widget tree of
    // an app and invoking 'build()' to render it.
    await widgetTester.pumpWidget(Person(age, firstName, lastName));

    // Calling 'text()' will try to find a 'Text' widget containing a
    // string that is equal to the given string.
    final firstNameFinder = find.text(firstName);
    final lastNameFinder = find.text(lastName);
    final ageFinder = find.text("$age");

    expect(firstNameFinder, findsOneWidget);
  });
}
