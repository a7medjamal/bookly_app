import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1';

  final Dio dio;

  ApiService(this.dio);

  Future<Response> get({required String endPoint}) async {
    return await dio.get('$baseUrl$endPoint');
  }
}
