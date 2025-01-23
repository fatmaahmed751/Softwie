
import 'package:dio/dio.dart';

class ApiServices {
  final baseUrl = 'https://dummyjson.com/products';
  final Dio dio;

  ApiServices(this.dio);


  Future<Map<String, dynamic>> getSearch({String? value}) async {
    try {
      var response = await dio.get(
        '$baseUrl/search?q=$value',
       // queryParameters: {'search': value},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data. Error:');
    }
  }
}