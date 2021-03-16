void main() {
  print("Hello, testing chapter!");

  print('''
    Three testing strategies:
    * Unit tests: Test executed on the unit level, that is, very small (often atomic)
      pieces of code, such as individual classes or functions. Unit tests verify that
      one particular unit functions correctly and maintains its "contract" to the outside
      world in all cases.
    * Widget tests: Performed on the layer of individual Flutter widgets. Widgets
      tests verify whether -- or how often -- a widget is present in the widget tree.
    * Integration tests: Performed on multiple units of functionality with a focus
      on verifying the interplay between those units is correct and fulfills an
      expected outcome.
  ''');

}
