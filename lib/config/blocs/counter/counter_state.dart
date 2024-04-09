part of 'counter_bloc.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counter;
  CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

// ignore: must_be_immutable
final class CounterInitial extends CounterState {
  CounterInitial(super.counter);
}

// ignore: must_be_immutable
final class CounterUpdate extends CounterState {
  @override
  // ignore: overridden_fields
  int counter;
  CounterUpdate({required this.counter}) : super(counter);
}
