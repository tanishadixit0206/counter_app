import 'dart:async';

import 'package:counter_app/data/services/remote/api_service.dart';
import 'package:counter_app/domain/repositories/conversion_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final ConversionRepository conversionRepository;
  ConverterBloc(this.conversionRepository) : super(DecimalToBinaryState("")) {
    on<ConvertEvent>(_onConvert);
    on<SwapConversionEvent>(_onSwap);
    on<ResetConversionEvent>(_onReset);
  }
  Future<void> _onConvert(event, emit) async {
    if (state is DecimalToBinaryState) {
      String output = await conversionRepository.decimalToBinary(event.input);
      emit(DecimalToBinaryState(output));
    } else if (state is BinaryToDecimalState) {
      String output = await conversionRepository.binaryToDecimal(event.input);
      emit(BinaryToDecimalState(output));
    }
  }

  Future<void> _onSwap(event, emit) async {
    if (state is BinaryToDecimalState) {
      emit(
        DecimalToBinaryState(""),
      );
    } else if (state is DecimalToBinaryState) {
      emit(
        BinaryToDecimalState(""),
      );
    }
  }

  Future<void> _onReset(event, emit) async {
    if (state is BinaryToDecimalState) {
      emit(
        BinaryToDecimalState(""),
      );
    } else if (state is DecimalToBinaryState) {
      emit(
        DecimalToBinaryState(""),
      );
    }
  }
}
