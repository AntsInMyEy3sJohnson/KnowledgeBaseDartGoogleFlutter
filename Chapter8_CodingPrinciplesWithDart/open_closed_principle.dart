// "Within a good architecture, one should be able to introduce new behavior without
// modifying existing source code." => "Software entities should be open for extensions,
// but closed for modifications." Or, in yet other words: "Depend on abstractions,
// not on concrete implementations."

/// Bad: Every time a new kind of shape is introduced, the method below has to be
/// modified. Thus, the act of introducing new behavior cannot be performed without
/// having to modify existing code.
class AreaCalculator {
  double calculate(Object shape) {
    if (shape is Rectangle) {
      return shape.width * shape.height;
    } else {
      final circle = shape as Circle;
      return circle.radius * Circle.PI;
    }
  }
}

class Rectangle {
  final double width;
  final double height;

  Rectangle(this.width, this.height);
}

class Circle {
  static final double PI = 3.1415;

  final double radius;

  Circle(this.radius);
}

// Way better: Define area calculation method in interface and let various
// shape classes implement interface
abstract class Area {
  double computeArea();
}

class Rectangle2 implements Area {
  @override
  double computeArea() => throw UnimplementedError();
}

class Circle2 implements Area {
  @override
  double computeArea() => throw UnimplementedError();
}

class Triangle implements Area {
  @override
  double computeArea() => throw UnimplementedError();
}

/// Now, new kinds of shapes can be easily introduced in the form of new
/// classes implementing the 'Area' interface, and the 'calculateArea' method
/// does not have to be modified to support newly introduced shapes.
class AreaCalculator2 {
  double calculateArea(Area shape) {
    return shape.computeArea();
  }
}
