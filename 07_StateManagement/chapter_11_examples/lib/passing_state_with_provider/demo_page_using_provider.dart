import 'package:chapter_11_examples/passing_state_with_provider/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Some more considerations on the Provider package:
// * Using the Provider package permits working with StatelessWidget most of the
// time (all the time?)
// * class 'Provider<T>' exposes the static method 'Provider.of<T>()' that
// retrieves the instance of the given type T from somewhere above in the widget
// tree
// * This is not only useful for implementing state change notifications, but
// also to cache and expose class instances. This can be very useful for sharing
// data between multiple pages.
// * Problem: 'Provider.of<T>()' starts looking for the instance of T in the
// widget tree one level above the calling widget. What if the method is called
// in the same widget? --> Exception
// --> Two solutions: (1) Wrap "providing" in parent widget; (2) Use 'Consumer<T>'
// (See 'consumer_example.dart')

// Good practices for using Provider
// * Whenever 'Provider.of<T>(context)' is invoked, the associated widget is
// rebuilt. This behavior is not desirable if Provider is used as a data cache,
// so it can be disabled by passing 'listen: false' to the 'of<T>()' method. This
// is also useful wherever a provider is invoked from outside the widget tree.
// * In general, prefer using Consumer over using 'Provider.of<T>()' -- will
// result in more fine-grained builds (only the parts of the widget tree that
// actually need a value will be rebuilt)
// * In case multiple providers are required, use 'MultiProvider'
// * Don't put Providers too high up the widget tree -- ideally, a Provider
// should be placed right above the first widget that needs it
// * Providers can also be used to return 'Future<T>' values
// * If widgets rebuild to often even when using Consumer, 'Selector<T, V>' offers
// even more fine-grained control to what gets rebuilt
// * In general, leave the default value for 'listen' -- 'true' -- in place
// when inside the widget tree, and use 'listen: false' ALWAYS when a Provider
// is called outside a 'build()' method (but don't worry about forgetting this,
// because having it set to 'true' will yield a runtime exception, so you'll
// definitely notice)
// * With version 4.0, Provider introduced two extension methods on 'BuildContext'
// that reduce the amount of boilerplate code to "watch" (listen: true) or "read"
// (listen: false) a value
// * Another extension method introduced is 'select' -- shorthand for implementing
// a Selector
// * Provider can be used even inside 'initState()' without a visible BuildContext
// (though only with 'listen: false' because 'listen: true' is not allowed outside
// a 'build()' method
class DemoPageUsingProvider extends StatelessWidget {
  const DemoPageUsingProvider();

  @override
  Widget build(BuildContext context) {
    // Pre-4.0
    // final counterModel = Provider.of<CounterModel>(context);
    // Post-4.0 using extensions on BuildContext
    final counterModel = context.watch<CounterModel>(); // --> listen: true

    // final someValueToBeReadAndNotWatched =
    //     context.read<Info>(); // --> listen: false
    // ^ This would throw a runtime exception because a Provider is invoked
    // with 'listen' set to 'false' inside a 'build()' method!

    return Scaffold(
      appBar: AppBar(
        title: Text("UI updates using Provider"),
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
                  onPressed: counterModel.increment),
              Text(
                "${counterModel.currentCount}",
                style: const TextStyle(fontSize: 40),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: counterModel.decrement,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetUsingSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Caution: When using Selector, make sure to use classes that override
    // 'operator==' or collections -- using mutable classes, the results might
    // not be as expected
    return Selector<Info, String>(
      selector: (context, info) => info.text,
      // Defining 'shouldRebuild()' is not useful here since Selector
      // will perform a deep comparison of the "selected", new value with
      // the previous one anyway, but in case a more sophisticated comparison
      // is required, it can be implemented within 'shouldRebuild()'
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, text, _) {
        return Text("$text");
      },
    );
  }
}

class WidgetWithFutureProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listens to a Future and exposes result to children
    return FutureProvider<String>(
      create: (_) async => _performHttpRequest(),
      catchError: (context, error) => "Something somewhere went terribly wrong",
      child: const Text("My widgets go here as usual"),
      // Default of 'true' will invoke 'create()' only once the value is read
      // and by setting this to 'false', the method will be invoked immediately
      // (--> read: the future will be fetched immediately)
      lazy: false,
    );
  }

  Future<String> _performHttpRequest() {
    return Future.value("Result of some HTTP request");
  }
}

class WidgetWithMultiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Info>(create: (_) => Info()),
        Provider<MoreInfo>(create: (_) => MoreInfo()),
        // ...
      ],
      child: const Text("Hi."),
    );
  }
}

class BetterYo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // Better: Use Consumer -- only Text will be rebuilt
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Consumer<Info>(
          builder: (_, info, __) => Text("${info.text}"),
        ),
      ),
    );
  }
}

class BadMkay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Info>(context);

    // Problem: Only the inner Text widget is really interested in the value,
    // but using Provider like this, Center and Padding will also be rebuilt.
    // Bad!
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text("${info.text}"),
      ),
    );
  }
}

class Info {
  final String text = "Blubbo";
}

class MoreInfo {
  final String moreText = "Blubba";
}
