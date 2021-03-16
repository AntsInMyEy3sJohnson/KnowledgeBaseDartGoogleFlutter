import 'package:chapter_11_examples/simple_state_management_with_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitDemoPage extends StatelessWidget {
  const CubitDemoPage();

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.watch<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("UI updates using Cubit"),
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
                onPressed: () => counterCubit.increment(),
              ),
              Text(
                "${counterCubit.state}",
                style: const TextStyle(fontSize: 50),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: () => counterCubit.decrement(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
