
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent{increase, decrease}

class CounterBloc2 extends Bloc<CounterEvent, int> {
  
  CounterBloc2() : super(0);
  
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event){
      case CounterEvent.increase:
        yield state + 1;
        break;
      case CounterEvent.decrease:
        if(state > 0) {
          yield state - 1;
        } else {
          yield state;  
        }
        break;
    }
  }
  
}