import 'package:dio/dio.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonPlaceHolderCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;
  JsonPlaceHolderCustomDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
    // var url = dotenv.get('JSONPLACEHOLDERURL', fallback: 'sane-default');
    // _dio.options.baseUrl = url;
  }
}
