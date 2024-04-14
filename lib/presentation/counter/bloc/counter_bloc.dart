import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 0;
  CounterBloc() : super(CounterInitial(0)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  void _onIncrement(event, emit) {
    _count++;
    emit(CounterUpdated(_count));
  }

  void _onDecrement(event, emit) {
    _count++;
    emit(CounterUpdated(_count));
  }
}
