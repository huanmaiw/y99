import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_endpoint.dart';

class AppDio {
  AppDio._() {
    provideDio();
  }

  late Dio _dio;

  final GetStorage _storage = GetStorage();

  final _options = BaseOptions(
    baseUrl: AppEndpoints.baseUrl,
    connectTimeout: const Duration(milliseconds: 120000),
    receiveTimeout: const Duration(milliseconds: 120000),
    extra: {'withCredentials': true},
  );

  Dio provideDio() {
    _dio = Dio(_options);
    //_dio.interceptors.add(CookieManager(_storage));
   // _dio.interceptors.add(HandleErrors());
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
