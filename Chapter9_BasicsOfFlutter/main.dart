void main() {

  // Some suggestions on a Flutter project's folder structure
  // lib/ --> App's source code, the following sub-folders might be
  // helpful:
  // * lib/routes: the app's pages
  // * lib/models: business logic
  // * lib/widgets: reusable UI widgets
  // * lib/localizations: If the app is supposed to support multiple languages, all
  // * localization logic should go here
  // test/ --> Contains all test files. Could be split like so:
  // * test/unit
  // * test/widget
  // * test/integration

  // Cases where the hot reload feature does not work
  // * Changes made to the 'initState()' method
  // * Definition of a class changed to 'enum' and vice-versa
  // * Modifications mode to static fields in classes
  // * Changes made to code inside the main method

  // Configuring the Dart linter
  // Create file 'analysis_options.yaml' in same folder where pubspec file is located
  // Dart documentation provides complete list of linter rules

  // Tree shaking and constants
  // Importing 'flutter/foundation.dart' might be useful while developing and debugging
  // as it exposes three constants that can be used during program execution that relate
  // to the application's currently active build/execution mode: debug, profile, release
  // kDebugMode, kProfileMode, kReleaseMode
  // The compiler will automatically perform 'Tree Shaking', i. e. it will automatically
  // remove pieces of code not used in the current build mode
  // Important: Tree Shaking works with any 'const' value

  // Widgets and State
  // Everything in Flutter is said to be a 'Widget' since everything (or almost everything,
  // some rare exceptions) in one way or the other is a descendant of the 'Widget' class
  // --> Composing user interfaces in Flutter is the process of putting widgets together
  // by nesting them inside one another. The result of this process is a hierarchy called
  // the 'Widget Tree'.
  // Adding widgets expands the widget tree, and the 'context' parameter in the 'build'
  // method -- that all descendants of 'StatefulWidget' or 'StatefulWidget' have to
  // implement -- provides important information about the position of a leaf in the tree.

  // Some basic widgets

  // Text: Highly customizable display of text

  // Row: Places one or more children on a horizontal axis using the given space constraints
  // Widgets can be placed in different ways according to value of 'mainAxisAlignment'
  // * center: Places items at center of row
  // * start: Places items at beginning of the row
  // * end: Places items at end of the row
  // * spaceAround: Places child items with equal distance between each, as well as the margins
  // * spaceBetween: Places items with equal space between them, erasing the margins

  // Column: Places one or more children in vertical axis with given space constraints
  // 'mainAxisAlignment' works in the same way as with rows, except the spacing refers to
  // the vertical axis as this is the column's main axis
  // Caution: A column does not have scrolling behavior! If there is not enough vertical
  // space on the screen, an overflow error will be thrown.

  // ListView: Column with scrolling behavior, thus very widely used
  // Widgets are aligned to the top. Default scrolling behavior is vertical, but can
  // be configured using the 'scrollDirection' parameter
  // Use 'ListView.builder()' when list of widgets is built from an existing collection

  // Container: Equivalent of '<div>' in realm of HTML -- general-purpose container
  // Very widely used as it can be employed to customize styling (painting, sizing,
  // edge styles, ...) of child widget
  // Use 'BoxDecoration' class to style ("decorate") container

  // Stack and Positioned
  // The Stack widget does not constrain width and height, so no overflow error will
  // occur if the Stack's children are placed outside the UI
  // The order of placing children really matters: Children placed at the bottom
  // of the list will be rendered on-screen, on top of the others. In other words,
  // the background widget always appears first in the list.
  // Use 'Positioned' to provide a fixed position for a widget in relation to the
  // parent widget

  // Stateless and stateful widgets
  // 'Widget': subclasses either 'StatelessWidget' or 'StatefulWidget' and thus
  // overwrites the 'build()' method
  // Stateless widget: Use when widget does not depend on external events or data sources,
  // but is "self-sufficient". Once created, the widget will be static ("immutable").
  // (This doesn't mean the widget can't take data from the outside -- it can declare
  // parameters in its constructor just like any other class --, it simply means the
  // passed data won't change once the object has been initialized because its internal
  // state doesn't change.)
  // Stateful widget: UI that is likely to change over time based on external events
  // or data sources (result of HTTP request, screen rotation, button tap, ...). Stateful
  // widgets are divided into two components: the widget itself, and its state. Whenever
  // Flutter rebuilds the widget tree to refresh the UI, the 'build()' method of
  // 'State<T>' -- implemented by the widget's state holder class -- is invoked.
  // Actors within the state holder class have access to the 'setState()' method.
  // Whenever 'setState()' is called, Flutter will rebuild the widget (only what's inside
  // the 'build()' method will be refreshed, though -- state living outside of it
  // will be preserved).
  // Important distinction: What changes is the state in the widget's state holder
  // class, not the widget itself -- once the widget has been inserted into the
  // widget tree, it won't change (just the stateless widgets). That's why stateful
  // widgets, too, can have a 'const' constructor.

  // Rough guideline for when to use a stateless widget and when to use a stateful 
  // one: When every instance variable of the widget can be 'final', then use 
  // a stateless widget with a 'const' constructor -- the internal state is immutable, 
  // so using a stateful widget wouldn't make any sense. If, on the other hand, at least
  // one instance variable cannot be final, it means the internal state of the widget's
  // instance(-s) is mutable and needs to be encapsulated within the state holder class
  // of a stateful widget.

  // Keys
  // Every widget in Flutter exposes the optional 'key' parameter
  // A key is used to uniquely identify a widget in the widget tree
  // Four types of keys: ValueKey, ObjectKey, UniqueKey, GlobalKey
  // ValueKey: Use when value naturally and uniquely identifies a business domain object.
  // (Also, ValueKey is the default type of key.)
  // ObjectKey: Use when multiple properties are required to uniquely identify an
  // instance of a complex object
  // UniqueKey: Unique across the entire app, so only equal to itself. Use when
  // there is no single unique value and no unique combination of values (so no
  // ValueKey and no ObjectKey, respectively).
  // GlobalKey: Useful to keep the state of multiple widgets in sync

}
