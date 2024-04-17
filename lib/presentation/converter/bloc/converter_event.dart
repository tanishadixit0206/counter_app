part of 'converter_bloc.dart';

abstract class ConverterEvent {}

class BinaryToDecimalEvent extends ConverterEvent{}

class DecimalToBinaryEvent extends ConverterEvent{}