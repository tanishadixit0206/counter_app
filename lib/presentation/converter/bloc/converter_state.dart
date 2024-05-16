part of 'converter_bloc.dart';

abstract class ConverterState {}

class BinaryToDecimalState extends ConverterState {
  static const String text1="Binary";
  static const String text2="Decimal";
  final String decimal;
  BinaryToDecimalState(this.decimal);
}

class DecimalToBinaryState extends ConverterState {
  static const String text1="Decimal";
  static const String text2="Binary";
  final String binary;
  DecimalToBinaryState(this.binary);
}
