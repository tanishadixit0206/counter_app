part of 'converter_bloc.dart';

abstract class ConverterState {
  String binary;
  String decimal;
  ConverterState(this.binary, this.decimal);
}

class BinaryToDecimalState extends ConverterState {
  BinaryToDecimalState(super.binary, super.decimal);
}

class DecimalToBinaryState extends ConverterState {
  DecimalToBinaryState(super.binary, super.decimal);
}
