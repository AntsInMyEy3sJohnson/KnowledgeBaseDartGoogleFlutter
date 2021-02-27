import 'package:bloc_test/bloc_test.dart';
import 'package:chapter_16_examples/unit_testing_blocs/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tests for 'CounterBloc'", () {
    blocTest(
      "Expect counter to emit '1' after one increment",
      build: () => CounterBloc(),
      act: (CounterBloc counterBloc) =>
          counterBloc.add(CounterEvent.countIncreased),
      expect: [1],
    );

    blocTest(
      "Expect bloc to emit correct event values",
      build: () => CounterBloc(),
      act: (CounterBloc counterBloc) => counterBloc
        ..add(CounterEvent.countIncreased)
        ..add(CounterEvent.countIncreased)
        ..add(CounterEvent.countDecreased)
        ..add(CounterEvent.countIncreased),
      expect: [1, 2, 1, 2],
    );
  });
}
