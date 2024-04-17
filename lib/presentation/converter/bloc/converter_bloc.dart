import 'package:counter_app/data/services/remote/api_service.dart';
import 'package:counter_app/domain/repositories/conversion_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc() : super(DecimalToBinaryState("", "")) {
    on<BinaryToDecimalEvent>(_onBinaryToDecimal);
    on<DecimalToBinaryEvent>(_onDecimalToBinary);
  }
  Future<void> _onBinaryToDecimal(event, emit) async {
    emit(BinaryToDecimalState(state.binary, state.decimal));
    print(state.decimal);
    print(state.binary);
    state.decimal = await binaryToDecimal(state.binary);
    print(state.decimal);
    print(state.binary);
  }

  Future<void> _onDecimalToBinary(event, emit) async {
    emit(DecimalToBinaryState(state.binary, state.decimal));
    print(state.decimal);
    print(state.binary);
    state.binary = await decimalToBinary(state.decimal);
    print(state.decimal);
    print(state.binary);
  }
}
