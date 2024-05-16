import 'dart:convert';

import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

dynamic url_dtb = dotenv.env['url_dtb'];
dynamic url_btd = dotenv.env['url_btd'];

class ApiService {
  
  Future<String> BinaryToDecimal(String binary) async {
    final dio = Dio();
    try {
      String data = jsonEncode({"num": binary});
      int contentLength = utf8.encode(data).length;
      Options options = Options(headers: {
        Headers.contentLengthHeader: contentLength,
      });
      final response = await dio.post(
        (url_btd is String) ? url_btd : "",
        data: {"num": binary},
      );
      String decimal = response.data["output"];
      print(response.data);
      print(decimal);
      print("converting binary to decimal");
      return decimal;
    } catch (error) {
      print("Error: $error");
      return "";
    }
  }

  Future<String> DecimalToBinary(String decimal) async {
    final dio = Dio();
    try {
      String data = jsonEncode({"num": decimal});
      int contentLength = utf8.encode(data).length;
      Options options = Options(headers: {
        Headers.contentLengthHeader: contentLength,
      });
      final response = await dio.post(
        (url_dtb is String) ? url_dtb : "",
        data: {"num": decimal},
        options: options,
      );
      String binary = response.data['output'];
      print(response.data);
      print(binary);
      print("converting decimal to binary");
      return binary;
    } catch (error) {
      print("Error: $error");
      return "";
    }
  }
}
