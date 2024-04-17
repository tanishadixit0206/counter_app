import 'package:counter_app/data/services/remote/api_service.dart';

Future<String> binaryToDecimal(String binary) async {
  String decimal = await BinaryToDecimal(binary);
  return decimal;
}

Future<String> decimalToBinary(String decimal) async {
  String binary = await BinaryToDecimal(decimal);
  return binary;
}
