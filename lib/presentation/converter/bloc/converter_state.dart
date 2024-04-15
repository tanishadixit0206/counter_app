part of 'converter_bloc.dart';

abstract class ConverterState {}

class ConverterInitial extends ConverterState{}

class ConverterError extends ConverterState {
  final String message;

  ConverterError(this.message);
}

