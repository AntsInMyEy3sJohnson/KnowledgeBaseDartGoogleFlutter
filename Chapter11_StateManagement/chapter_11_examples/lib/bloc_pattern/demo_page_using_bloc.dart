import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// BLoC: "_B_usiness _Lo_gic _C_omponents", pattern for state management relying on
// asynchronous streams
// Basically, Bloc is about the conversion of an event into state. To do so,
// three steps are involved:
// (1) Widget sends an event to Bloc (which is a class implementing some logic
// to handle such events)
// (2) Bloc is notified due to the new event that has arrived on its stream, which
// it processes into some output (a new state for listening widgets)
// (3) The listening widgets receive the new state and thus rebuild
// --> Nice because it also allows us to separate business logic and state
// management from UI handling, thus respecting SRP

class DemoPageUsingBloc extends StatelessWidget {
  const DemoPageUsingBloc();

  @override
  Widget build(BuildContext context) {
    // Nice: Bloc can be retrieved via Provider
    // (Warning about closing instance of 'dart.core.Sink' can be ignored -- false positive)
    final enumCounterBloc = context.watch<CounterBlocWithEventEnum>();
    final classCounterBloc = context.watch<CounterBlocWithEventClass>();

    return Scaffold(
      appBar: AppBar(
        title: Text("UI updates using BLoC pattern"),
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
                onPressed: () {
                  // return enumCounterBloc.add(CounterEventAsEnum.countIncreased);
                  return classCounterBloc.add(new Increment());
                },
              ),
              Text(
                // "${enumCounterBloc.state}",
                "${classCounterBloc.state.currentCount}",
                style: const TextStyle(fontSize: 40),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: () => classCounterBloc.add(new Decrement()),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

abstract class CounterEventAsClass {
  const CounterEventAsClass();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterEventAsClass && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Increment extends CounterEventAsClass {
  // If additional information about the event were required, it would go here
  const Increment();
}

class Decrement extends CounterEventAsClass {
  const Decrement();
}

class CounterState {
  final int _count;

  const CounterState(this._count);

  int get currentCount => _count;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          _count == other._count;

  @override
  int get hashCode => _count.hashCode;
}

class CounterBlocWithEventClass
    extends Bloc<CounterEventAsClass, CounterState> {
  CounterBlocWithEventClass() : super(const CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEventAsClass event) async* {
    if (event is Increment) {
      yield CounterState(state.currentCount + 1);
    } else if (event is Decrement && state.currentCount > 0) {
      yield CounterState(state.currentCount - 1);
    } else {
      yield CounterState(0);
    }
  }
}

// For more complex use cases, it's better to use a class rather than an enum.
// Example: Whenever an event needs to have some additional info, a class is
// the better choice
enum CounterEventAsEnum { countIncreased, countDecreased }

class CounterBlocWithEventEnum extends Bloc<CounterEventAsEnum, int> {
  // Pass default value to superclass
  CounterBlocWithEventEnum() : super(0);

  @override
  Stream<int> mapEventToState(CounterEventAsEnum event) async* {
    switch (event) {
      case CounterEventAsEnum.countIncreased:
        yield state + 1;
        break;
      case CounterEventAsEnum.countDecreased:
        if (state > 0) {
          yield state - 1;
        }
        yield state;
        break;
    }
  }
}
