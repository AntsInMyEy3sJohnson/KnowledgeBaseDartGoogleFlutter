import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage();

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

// Calling 'setState()' in and of itself is not a problem, and neither is
// making use of 'StatefulWidget' and its state holder class. Problems do
// arise, however, once the widget tree grows larger -- if 'setState()'
// is called in a parent widget somewhere within the tree and is thus rebuilt,
// all its children have to be rebuilt, too, even if they don't share any state
// with the parent widget at all. This can have a dramatic impact on performance.
// To make Flutter rebuild only the widgets that actually depend on some changed
// state somewhere up the widget tree, one can use 'InheritedWidget', but this
// approach produces a lot of boilerplate code and thus makes the code harder to
// maintain and reason about. --> Use other solutions instead, such as the
// Provider package (which, in fact, is just syntactic sugar for InheritedWidget).
// Also: By using 'setState()', you mix UI with business logic. Example: The state
// holder class below violates the SRP because it does too many things at once
// (drawing, business logic to take care of '_counter', handling state)

// Some good practices for working with 'State<T>'
// * Perform initialization work within the 'initState()' for anything more
// complex than a simple value assignment
// * 'setState()' should never compute anything, but only update values. Anything
// that can be placed outside 'setState()', should be placed outside 'setState()'.
// * Do not invoke 'initState()' after having called 'dispose()' since this will
// lead to undefined behavior. (Use the 'mounted' property to check whether a
// widget has been created and not yet disposed)

// --> Using StatefulWidget is fine, but try to avoid managing state
// with 'setState()'.
class _DemoPageState extends State<DemoPage> {
  int _counter = 0;

  // Called only once during state creation, so good place to do some
  // configuration work or set some properties
  @override
  void initState() {
    super.initState();
  }

  // Invoked only once when state gets destroyed -- convenient means to perform
  // clean-up tasks such as freeing resources
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI updates using 'setState()'"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                  onPressed: _increment),
              Text(
                "$_counter",
                style: const TextStyle(fontSize: 40),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: _decrement,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }
}
