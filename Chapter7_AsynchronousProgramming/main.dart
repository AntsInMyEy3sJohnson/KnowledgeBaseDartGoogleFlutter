import 'dart:math';

import 'random_stream.dart';

void main() async {
  final result = heavyWeightMethod(10);
  result.then((data) => print("Data from heavyweight method: $data"));
  print("Future is bright");

  // Processing Futures can be chained:
  heavyWeightMethod(10)
      .then(method1)
      .then(method2)
      .then(method3)
      .then(print)
      .catchError((e) => print(e.message));
  // But: That's very verbose -- prefer 'async' and 'await'

  // If completion of a set of Futures is to be awaited without blocking execution flow,
  // one can use Future.wait():
  Future<int> one = method1(10);
  Future<int> two = method2(10);
  Future<int> three = method3(10);

  Future.wait([one, two, three])
      .then((value) => print("${value[0]}, ${value[1]}, ${value[2]}"));

  // Some more useful named constructors:
  // .delayed(): Starts running after given delay
  final delayedFuture = Future.delayed(const Duration(seconds: 2), () => 1);
  //.error(): Creates Future object that terminates with error
  final erroneousFuture = Future.error("Fail").catchError(print);
  //.value(): Completes immediately, returning the given value. Used to wrap non-Future in Future value.
  final valuedFuture = Future.value(42);
  //.sync(): Invokes callback immediately (very few usages in practice
  final synchronizedFuture = Future.sync(() => print("I'm called immediately"));

  // 'async' and 'await'
  // Make code less verbose and thus easier to comprehend.
  // Version using 'then':
  final withThen = heavyWeightMethod(10);
  withThen.then((value) => print("Result: $value"));
  // Version using 'async' and 'await':
  final withAwait = await heavyWeightMethod(12);
  // To be able to use the 'await' keyword, the enclosing method needs to be marked as 'async'
  print("Result: $withAwait");

  // Caution: Everything after 'await' is run only once the Future has completed
  // So, the following two are not equivalent:
  // Version with 'await'
  final heavy1 = await heavyWeightMethod(20);
  print("Result: $heavy1");
  print("Something");
  // Version with 'then' the previous 'await' is not equivalent to:
  final heavy2 = heavyWeightMethod(21);
  heavy2.then((value) => print("Result: $heavy2"));
  print("Something");
  // Instead, the previous 'await' is equivalent to:
  final heavy3 = heavyWeightMethod(22);
  heavy3.then((value) {
    print("Result: $heavy3");
    print("Something");
  });

  // => Use 'await' whenever the result of a computation is needed in the following lines,
  // and use 'then()' if the result is okay to be processed eventually.

  // Also, good practice: Returning a Future from a method by prefixing the method
  // name with 'async' is easier than by using 'Future.value()'.
  Future<int> futureMethod1() => Future<int>.value(42);
  Future<int> futureMethod2() async => 42; // Less verbose

  // Streams
  // Sequence of asynchronous or synchronous events we can listen to
  // Involved components:
  // Generator to lazily create new data
  // Stream where the generator pushes the data in
  // Subscriber as someone who's interested in a stream's data, automatically get notified
  // whenever there is new data on the stream

  // Two types of generators:
  // Asynchronous generators yield Stream<T> that subscribers can process with 'await'
  // Synchronous generators yield Iterable<T> that can be processed synchronously (e. g. in a simple loop)

  Stream<int> randomNumbers() async* {
    // We want asynchronous generator, so return type has to be a Stream<T>
    // async* permits usage of the 'yield' keyword

    final random = Random();

    for (var i = 0; i < 3; ++i) {
      await Future.delayed(
          Duration(seconds: 1)); // Delay execution flow for one second
      yield random.nextInt(50) + 1; // Pushes a piece of data into the stream
      // Whenever a function declares 'async*', a 'return' statement wouldn't
      // make, so there can't be any
      // For synchronous generators, the 'sync*' modifier is available; usage of the
      // 'yield' keyword is the same
    }

    // Important: Generators can define multiple 'yield' statements -- that would
    // simply cause more pieces of data being pushed into the Stream or Iterable
  }

  // Some useful named constructors for creating generators:
  // Stream.periodic(), Stream.value(), Stream.error(), Stream.forIterable(), Stream.fromFuture()

  // Most often used methods on a stream:
  // drain(), map(), skip()

  // Subscribing to a stream
  // Subscription happens when something obtains a reference to the generator ("on-demand initialization")
  final stream = randomNumbers();
  await for (var value in stream) {
    // Listen for values sent into the stream by the generator
    print(value);
  }
  // Note: Generally, generators are put into classes and exposed via getters returning
  // a 'Stream<T>' instance or by means of a 'listen()' method performing manual subscription

  // Another example of a stream:
  Stream<int> anotherCounterStream(
      [int maxCount = 1000, int intervalSeconds = 1]) async* {
    final interval = Duration(seconds: intervalSeconds);

    var count = 0;
    while (true) {
      if (count == maxCount) break;
      await Future.delayed(interval);
      yield ++count;
    }
  }

  await for (int i in anotherCounterStream(2)) {
    print(i);
  }

  // yield*: Suspend execution in current generator, pass it to another one,
  // and resume execution once the other generator has finished
  final numbersToTen = List<int>.generate(10, (index) => index);
  Stream<int> evenNumbersUpToTen = Stream.fromIterable(
      numbersToTen.where((element) => element % 2 == 0).toList());
  Stream<int> oddNumbersUpToTen = Stream.fromIterable(
      numbersToTen.where((element) => element % 2 != 0).toList());

  Stream<int> numberGenerator([bool even = true]) async* {
    if (even) {
      yield 0; // Yield value
      yield* evenNumbersUpToTen; // Suspend execution of current generator, invoke given generator
      yield 0; // Yield value once yield* generator has sent 'done' event
    } else {
      yield -1;
      yield* oddNumbersUpToTen;
      yield -1;
    }
  }

  // Using a controller
  final controllerStream = RandomStream().stream;
  final controllerStreamSubscription = controllerStream.listen((event) {
    print(event);
  });

  await Future.delayed(const Duration(milliseconds: 2100));
  controllerStreamSubscription.cancel();
  // => Controllers are a little more complex to set up and use, but also more
  // powerful and scalable --> Prefer controllers over working with plain streams

  // Isolates
  // In programming languages like Java and C#, all threads running in the same process
  // share the same memory --> Requires careful attention when programming in multi-threaded environment
  // In contrast to this, a process in Dart is made up of one or more so-called Isolates, and
  // each Isolate uses its own memory.
  // In each Isolate, there is an event loop as the engine running Dart code.
  // Example:

  int getTime() {
    return 23;
  }

  void printName() async {

    int generateID() => 42;
    Future<String> performRequest(int id) async {
      // Call some database or invoke an HTTP endpoint or...
      return "Result of the request";
    }

    final int id = generateID();
    final String name = await performRequest(id);

    print(name);

  }

  printName();
  final time = getTime();

  // Based on this, the series of events passed to the event loop
  // of the Isolate looks like the following:
  // [<in printName()> print(name)] --> [getTime()] --> [<in printName()> generateID(), performRequest()] --> [event loop]
  // This is because the callback is split from the actual event in order not
  // to waste time when waiting for 'performRequest()', and the event is "remembered"
  // and added to the execution queue to be run as soon as the Future completes.
  // In other words, the execution of 'printName()' is divided into multiple events for the event loop to process.

  // Can there be multiple Isolates?
  // Yes, by employing 'Isolate.spawn()' in plain Dart or 'Future<T> compute(...)' in Flutter.
  // Communication between Isolates by means of messages since they don't share resources
  // For send and receive messages, Isolates expose a 'SendPort' and a 'ReceivePort', respectively

}



Future<int> method1(int value) {
  return Future.value(value + 1);
}

Future<int> method2(int value) {
  return Future.value(value + 2);
}

Future<int> method3(int value) {
  return Future.value(value + 3);
}

// Basically:
Future<int> heavyWeightMethod(int value) {
  for (int i = 0; i < value * 1000; i++) {
    for (int j = 0; j < i; j++) {
      // Some operation that takes a lot of time
    }
  }
  return Future.value(42);
}
