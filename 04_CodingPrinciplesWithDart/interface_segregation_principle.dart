// "Clients must not be forced to implement behavior they don't need" --> Prefer
// smaller interfaces over large ones.

// Bad:
abstract class Worker {
  void work();
  void sleep();
}

class Human implements Worker {
  @override
  void work() => print("Working.");
  @override
  void sleep() => print("Sleeping.");
}

class Robot implements Worker {
  @override
  void work() => print("Working.");
  @override
  void sleep() => print("Robots don't sleep?!"); //???
}

// Better: Split definition of working and sleeping methods into multiple interfaces:
abstract class Worker2 {
  void work();
}

abstract class Sleeper {
  void sleep();
}

class Human2 implements Worker2, Sleeper {
  @override
  void work() => print("Working.");
  @override
  void sleep() => print("Sleeping.");
}

class Robot2 implements Worker2 {
  @override
  void work() => print("Working.");
}

