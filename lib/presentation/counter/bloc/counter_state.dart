part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {
  final int count;

  CounterInitial(this.count);
}

class CounterUpdated extends CounterState {
  final int count;

  CounterUpdated(this.count);
}

class CounterError extends CounterState {
  final String message;

  CounterError(this.message);
}

