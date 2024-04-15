part of 'counter_bloc.dart';

abstract class CounterState {
  int count;
  CounterState(this.count);
}

// class CounterInitial extends CounterState {
//   final int count;

//   CounterInitial(this.count);
// }

class CounterUpdated extends CounterState {
  CounterUpdated(super.count);
}

// class CounterError extends CounterState {
//   final String message;

//   CounterError(this.message);
// }
