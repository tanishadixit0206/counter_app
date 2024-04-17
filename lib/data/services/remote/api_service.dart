import "package:flutter/material.dart";
import 'package:dio/dio.dart';

Future<String> BinaryToDecimal(String binary) async {
  final dio = Dio();
  final response = await dio.post(
    "http://127.0.0.1:5000/btd",
    data: {"num": binary},
  );
  String decimal = response.data.output;
  print(response.data);
  print(decimal);
  return decimal;
}

Future<String> DecimalToBinary(String decimal) async {
  final dio = Dio();
  final response = await dio.post(
    "http://127.0.0.1:5000/dt",
    data: {"num":decimal},
  );
  String binary = response.data.output;
  print(response.data);
  print(binary);
  return binary;
}