import 'package:dio/dio.dart';

class GithubRestClient {
  static final String _baseUrl = 'https://api.github.com/users/s7Thiago';

  Future<Response> getResponse(String path) async {
    final response = await Dio().get('$_baseUrl$path');
    return response;
  }
}