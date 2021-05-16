import 'package:flutter/material.dart';

// Business logic now within its own class, separated from the UI -- magnitudes
// more desirable than previous solution because this is the foundation for
// adhering to the SRP
// The "Model" -- the business logic part -- now has to be linked to the UI part.
// Step 1: Use the 'ChangeNotifierProvider' to create an instance of the model class
// Step 2: Use 'Provider.of()' to retrieve the model class along with its state wherever needed
class CounterModel with ChangeNotifier {

  int _counter = 0;

  int get currentCount => _counter;
g
  void increment() {
    _counter++;
    // Notify listeners (widgets interested in the state) rather than invoking
    // 'setState()' directly
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

}