// "Subclasses should be substitutable with their parent classes without
// impeding the logical correctness of the program." --> A subtype must
// guarantee it can fulfil the "contract" of its supertype plus anything
// it wants to introduce on its own.abstract

///Bad:
class Rectangle {
  double width;
  double height;
  Rectangle(this.width, this.height);
}

class Square extends Rectangle {
  Square(double length): super(length, length);
}

void badSample() {
  Rectangle fail = Square(3);
  // BAD! Correct from the code's view, but violates the domain semantics dictating
  // that the sides of a square must be equal in length
  fail.height = 6;
  fail.width = 8;
  // The LSP is broken because the given inheritance hierarchy cannot guarantee
  // the subclass will maintain the logical (semantic) correctness of the code.

  // This example also shows that inheriting from abstract classes or interfaces
  // rather than concrete implementations is good practice (=> "Prefer composition
  // over inheritance").

  // General approach to construct abstractions that adhere to the LSP: Depend on
  // abstractions rather than concrete implementations. Example: An interface does
  // not provide any specific implementation, hence depending on it cannot break the
  // LSP.
}
