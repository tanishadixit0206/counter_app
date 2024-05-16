import 'package:counter_app/data/services/remote/api_service.dart';

class ConversionRepository {
  final ApiService apiService;
  ConversionRepository(this.apiService);

  Future<String> binaryToDecimal(String binary) async {
    print("in repository before call");
    String decimal = await apiService.BinaryToDecimal(binary);
    print("in repository after call");
    return decimal;
  }

  Future<String> decimalToBinary(String decimal) async {
    print("in repository before call");
    String binary = await apiService.DecimalToBinary(decimal);
    print("in repository after call");
    return binary;
  }
}
