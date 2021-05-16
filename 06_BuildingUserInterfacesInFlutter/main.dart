void main() {

  // (details see code)
  // Material
  // Common Android look-and-feel.

  // Basic widgets
  // * Scaffold
  // * AppBar
  // * Drawer
  // * FloatingActionButton, FAB

  // Buttons
  // * RaisedButton
  // * FlatButton
  // * ButtonBar
  // * IconButton

  // Dialogs
  // * AlertDialog
  // * SimpleDialog
  // * showBottomSheet

  // Cupertino
  // Focuses on typical iOS design.

  // CupertinoApp
  // CupertinoPageScaffold
  // CupertinoTabScaffold
  // CupertinoNavigationBar
  // CupertinoTabBar
  // CupertinoTabView
  // CupertinoAlertDialog
  // CupertinoButton
  // CupertinoColors

  // Some best practices for targeting both Android and iOS with an app
  // * Build a UI that looks amazing on both platforms. Don't use two different
  // versions of widgets depending on the platform the app currently runs on
  // because this will, in essence, result in two code bases required to be developed
  // and maintained.
  // * Don't rely on platform-specific features or configurations.
  // * Try to build a 'responsive' UI, i. e., one that is able to adapt to various
  // screen sizes and -orientations. The 'LayoutBuilder' widget is a good means to
  // achieve this. The LayoutBuilder provides information about its parent's
  // constraints, such as the available width and height. Based on that information,
  // some logic can decide, for example, on the widgets to use and how to lay them out.
  // Alternative: 'MediaQuery'
  // * But: Although 'MediaQuery.of(context)' holds a lot of meta data about the physical
  // screen sizes, it knows nothing about the containing widget. Therefore, don't use
  // it to calculate spaces and dimensions.
  // * To calculate those, use a LayoutBuilder instead because it provides the dimensions
  // of the containing widget (albeit at the cost of knowing nothing about the entire screen)
  // * To get information about the device's orientation, the 'OrientationBuilder' can also
  // be used, but similar to the LayoutBuilder, it provides information on the containing
  // widget -- not on the entire screen. Therefore, the orientation it delivers is the
  // orientation of the containing widget, not of the entire screen.

  // Scrolling and constraints
  // A 'Column' is infinite along its main axis -- it has a defined beginning (the top
  // of its parent widget), but because it always tries fill the entire available
  // space, it doesn't have a defined end. The same goes for a ListView. Hence,
  // if you tried to nest them inside one another, both would try to fill the entire
  // available space, but if there is no parent widget defining what 'available' means,
  // this attempt would result in a runtime error.
  // --> Solution: Nest them inside a widget that defines a finite height.
  // Ways to do this:
  // (1) Use 'Expanded' widget: Expands to fill the remaining space, thus providing
  // its child (and all of its children, in turn) with a well-defined set of dimensions
  // Set 'ListView.shrinkWrap' to 'true': Makes the contained list occupy only the
  // space it needs. Therefore, since the height can be calculated based on the list's
  // children, it becomes well-defined rather than infinite
  // Most often, 'Expanded' is the most convenient option, but generally speaking, a
  // list -- or any widget with a, by default, infinite height (or width, in case of
  // a Row) -- can be put inside any widget providing a well-defined height, such as
  // 'SizedBox' and 'Container'.

  // Using themes





}