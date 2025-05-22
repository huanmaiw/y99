import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_routers.dart';

class AppDio {
  AppDio._() {
    provideDio();
  }

  late Dio _dio;

  final _options = BaseOptions(
    baseUrl: AppEndpoints.host,
    connectTimeout: const Duration(milliseconds: 120000),
    receiveTimeout: const Duration(milliseconds: 120000),
    extra: {'withCredentials': true},
  );

  Dio provideDio() {
    _dio = Dio(_options);
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
    return _dio;
  }

  static final AppDio instance = AppDio._();
}
