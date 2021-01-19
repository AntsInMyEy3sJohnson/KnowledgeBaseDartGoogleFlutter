// "A class or module should only have a single responsibility, i. e., a single
// task or a set of closely related tasks it is responsible for achieving"
import 'dart:web_gl';

/// Really, really bad in terms of the SRP because it performs calculations,
/// draws stuff onto some canvas, and GETs resources from the Internet. In other
/// words, this class has many responsibilities, hence it's likely it would have
/// to be extended or modified very often.
class Bad {
  final cache = <String>[];

  // Calculations
  double squareArea(double l) {
    /*...*/
  }

  double circleArea(double r) {
    /*...*/
  }

  //...
  // Paint to the screen
  void paintSquare(Canvas c) {
    /*...*/
  }

  void paintCircle(Canvas c) {
    /*...*/
  }

  void paintTriangle(Canvas c) {
    /*...*/
  }

  //...
  // GET requests
  String wikiArticle(String figure) {
    /*...*/
  }

  void _cacheElements(String text) {
    /*...*/
  }

}

// How about this instead?
// Three responsibilities (area calculations, drawing, networking) and
// three ways to express them, so each class -- or hierarchy of classes -- has
// precisely one responsibility (i. e., one task or one set of related tasks to
// accomplish), which makes the code a lot easier to modify, extend, and reason about.

/// Responsible for calculations
abstract class Shape{
  double area();
}
class Square extends Shape{
  @override
  double area() => throw UnimplementedError("Nothing to see here yet, folks");
}
class Circle extends Shape {
  @override
  double area() => throw UnimplementedError("Nothing to see here yet, folks");
}
class Rectangle extends Shape {
  @override
  double area() => throw UnimplementedError("Nothing to see here yet, folks");
}

/// UI painting
class ShapePainter{}

/// Networking
class OnlineShapeManager{}
