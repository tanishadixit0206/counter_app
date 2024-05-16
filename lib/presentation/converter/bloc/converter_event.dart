part of 'converter_bloc.dart';

abstract class ConverterEvent {}

class ConvertEvent extends ConverterEvent {
  final String input;
  ConvertEvent(this.input);
}

class SwapConversionEvent extends ConverterEvent {}

class ResetConversionEvent extends ConverterEvent {}
