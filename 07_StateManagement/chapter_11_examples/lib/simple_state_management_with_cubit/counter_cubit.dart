import 'package:flutter_bloc/flutter_bloc.dart';

/// In comparison to the Bloc version of the counter app, the cubit version
/// is much simpler to write because Cubits don't have states or events -- they
/// simply emit new states using methods.
class CounterCubit extends Cubit<int> {

  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state -1);


}