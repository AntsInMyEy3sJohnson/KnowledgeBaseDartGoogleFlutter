void main() {
  // The SOLID principles
  // S: Single Responsibility Principle
  // O: Open-Closed Principle
  // L: Liskov Substitution Principle
  // I: Interface Segregation Principle
  // D: Dependency Inversion Principle

  // Dependency injection
  // Strong dependency of 'PaymentProcessor' and 'Checker' to 'PaymentValidator'
  // makes the code very hard to change as such changes will ripple through those
  // classes.

  // Possible solution: Constructor injection
  // The payment processor class know nothing about the concrete payment validation method.
  // If we wanted to introduce Visa-based payment validation, that would be as simple
  // as adding a new class that implements 'PaymentValidatorCI' and passing an instance
  // of that new class to the payment processor.
  final paymentProcessor1 = const PaymentProcessorCI(MasterCardCI());
  final paymentProcessor2 = const PaymentProcessorCI(PayPalCI());
  // Similarly, the CheckerCI subclasses can provide their specific payment checks.
  // --> Dependency to the payment processor class still present, but it's now a
  // weak dependency --> Dependency Inversion Principle implemented by means of
  // constructor injection

  // Method injection can also model such weak dependencies, but the meaning of such
  // a dependency differs from a dependency fulfilled by means of constructor injection.
  // Generally, whenever a dependency is a must-have for a class, use constructor injection,
  // and whenever a dependency is optional -- the functionality it fulfils in this class
  // may or may not be invoked --, use method injection.

}

// Better: Use constructor injection
abstract class PaymentValidatorCI {
  const PaymentValidatorCI();

  void validatePayment(int amount);
}

class MasterCardCI implements PaymentValidatorCI {
  const MasterCardCI();

  @override
  void validatePayment(int amount) {
    // Mastercard-based payment validation things
  }
}

class PayPalCI implements PaymentValidatorCI {
  const PayPalCI();

  @override
  void validatePayment(int amount) {
    // PayPal-based payment validation things
  }
}

class PaymentProcessorCI {
  final PaymentValidatorCI _paymentValidatorCI;

  const PaymentProcessorCI(this._paymentValidatorCI);

  void pay(int amount) {
    _paymentValidatorCI.validatePayment(amount);
    // More payment stuff
  }
}

abstract class CheckerCI {
  PaymentValidatorCI doPaymentCheck();
}

class CheckerOneCI implements CheckerCI {
  @override
  PaymentValidatorCI doPaymentCheck() => throw UnimplementedError();
}

class CheckerTwoCI implements CheckerCI {
  @override
  PaymentValidatorCI doPaymentCheck() => throw UnimplementedError();
}

// Bad!
class PaymentValidator {
  final DateTime dateTime;
  final String cardNumber;

  const PaymentValidator(this.dateTime, this.cardNumber);

  void validatePayment(int amount) {
    // Do stuff
  }
}

class PaymentProcessor {
  final PaymentValidator _paymentValidator;

  PaymentProcessor(String cardNumber)
      // Strong dependency to PaymentValidator
      : _paymentValidator = PaymentValidator(DateTime.now(), cardNumber);

  DateTime get expiryDate => _paymentValidator.dateTime;

  void pay(int amount) {
    _paymentValidator.validatePayment(amount);
    // More stuff
  }
}

abstract class Checker {
  // Strong dependency to PaymentValidator -- propagated to all subclasses
  PaymentValidator doMasterCardCheck();
}

class CheckerOne extends Checker {
  @override
  PaymentValidator doMasterCardCheck() => throw UnimplementedError();
}

class CheckerTwo extends Checker {
  @override
  PaymentValidator doMasterCardCheck() => throw UnimplementedError();
}
