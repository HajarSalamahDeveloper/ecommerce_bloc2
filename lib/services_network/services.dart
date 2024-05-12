import 'dart:io';

import 'package:dio/dio.dart';

import '../core/app_url/app_url.dart';
import 'app_exceptions.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppUrl.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<dynamic> getApi(String url) async {
    try {
      print("srep1");
      Response response = await dio.get(url);
      print("url$url");
      return response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
  }
}
