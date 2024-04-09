import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    on<CounterIncrementeEvent>((event, emit) {
      emit(CounterUpdate(counter: state.counter + 1));
    });
    on<CounterDecrementeEvent>((event, emit) {
      emit(CounterUpdate(counter: state.counter - 1));
    });
  }
}
