import 'package:dio/dio.dart';
class ApiServices {
  final Dio _dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiServices(this._dio);
  Future<Map<String, dynamic>> get({required endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
// dependencies: dio: ^5.7.0
