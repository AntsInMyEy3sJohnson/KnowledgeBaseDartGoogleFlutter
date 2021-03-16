import 'package:chapter_11_examples/bloc_pattern/counter_display.dart';
import 'package:chapter_11_examples/bloc_pattern/demo_page_using_bloc.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoPageUsingBlocListener extends StatelessWidget {

  const DemoPageUsingBlocListener();

  @override
  Widget build(BuildContext context) {
    // Using the BlocListener, we can listen to events on the stream and
    // process them
    return BlocListener<CounterBlocWithEventEnum, int>(
      listener: (context, state) {
        Flushbar(
          message: "Counter has been altered to $state!",
          duration: Duration(seconds: 1),
        )..show(context);
      },
      // Useless here, but this can be used to decide whether or not to invoke
      // the listener callback
      listenWhen: (previous, current) => current > 3,
      child: const CounterDisplay(),
    );
  }
}

class GenericObserver extends BlocObserver {


  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Object transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    print("$error: $stackTrace");
  }

}
