import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chapter_11_examples/bloc_pattern/demo_page_using_bloc.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay();

  @override
  Widget build(BuildContext context) {

    final counterBloc = context.watch<CounterBlocWithEventEnum>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("UI updates using BLoC pattern"),
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
                onPressed: () =>
                    counterBloc.add(CounterEventAsEnum.countIncreased),
              ),
              Text(
                "${counterBloc.state}",
                style: const TextStyle(fontSize: 40),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: () =>
                    counterBloc.add(CounterEventAsEnum.countDecreased),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
