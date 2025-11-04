import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioProvider {
  static provide({required String baseUrl, Interceptor? interceptor}) {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      //todo if there is any query params add them here
      baseUrl: baseUrl,

      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Accept-Language": "en"
      },
    );
    if (interceptor != null) dio.interceptors.add(interceptor);
    _initDioWithLogInterceptor(dio);
    return dio;
  }

  static _initDioWithLogInterceptor(Dio dio) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        compact: false,
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );
  }
}
