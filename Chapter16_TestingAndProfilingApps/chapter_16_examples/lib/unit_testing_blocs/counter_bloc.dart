import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { countIncreased, countDecreased }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.countIncreased:
        yield state + 1;
        break;
      case CounterEvent.countDecreased:
        if (state > 0) {
          yield state - 1;
        }
        yield state;
        break;
    }
  }
}
