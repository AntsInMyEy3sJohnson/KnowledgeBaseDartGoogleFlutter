import 'package:bloc_test/bloc_test.dart';
import 'package:chapter_16_examples/testing_widgets/widget_with_counter_bloc.dart';
import 'package:chapter_16_examples/unit_testing_blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class CounterBlocMock extends MockBloc<int> implements CounterBloc {}

void main() {
  final counterBloc = CounterBlocMock();
  whenListen(counterBloc, Stream.fromIterable([0, 1, 2]));

  testWidgets("Test widget with CounterBloc",
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CounterBloc>.value(
          value: counterBloc,
          child: Center(child: const WidgetWithCounterBloc()),
        ),
      ),
    );

    expect(counterBloc.state, equals(2));
  });
}
