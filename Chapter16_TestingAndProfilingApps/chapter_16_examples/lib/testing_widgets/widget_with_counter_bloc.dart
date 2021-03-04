import 'package:chapter_16_examples/unit_testing_blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetWithCounterBlocHome extends StatelessWidget {
  const WidgetWithCounterBlocHome();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const WidgetWithCounterBloc(),
    );
  }
}

class WidgetWithCounterBloc extends StatelessWidget {
  const WidgetWithCounterBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget-testing a bloc"),
      ),
      body: const _CenterWithCounter(),
    );
  }
}

class _CenterWithCounter extends StatelessWidget {

  const _CenterWithCounter();

  @override
  Widget build(BuildContext context) {

    final counterBloc = context.watch<CounterBloc>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.green,
              onPressed: () => counterBloc.add(CounterEvent.countIncreased),
            ),
            Text(
              "${counterBloc.state}",
              style: const TextStyle(fontSize: 40),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              color: Colors.red,
              onPressed: () => counterBloc.add(CounterEvent.countDecreased),
            ),
          ],
        ),
      ),
    );
  }

}
