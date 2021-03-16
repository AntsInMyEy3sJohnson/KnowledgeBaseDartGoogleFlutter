import 'package:chapter_16_examples/integration_testing/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCounterScaffold extends StatelessWidget {
  const SimpleCounterScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integration testing sample"),
      ),
      body: BlocProvider(
        create: (_) => CounterBloc2(),
        child: const _SimpleCounter(),
      ),
    );
  }
}

class _SimpleCounter extends StatelessWidget {
  const _SimpleCounter();

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.watch<CounterBloc2>();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              key: Key("counterIncrementButton"),
              icon: const Icon(Icons.add),
              color: Colors.green,
              onPressed: () => counterBloc.add(CounterEvent.increment),
            ),
            Text(
              "${counterBloc.state}",
              key: Key("counterStateText"),
              style: const TextStyle(fontSize: 35),
            ),
            IconButton(
              key: Key("counterDecrementButton"),
              icon: const Icon(Icons.remove),
              color: Colors.red,
              onPressed: () => counterBloc.add(CounterEvent.decrement),
            ),
          ],
        ),
      ),
    );
  }
}
