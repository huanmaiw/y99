import 'package:Y99/core/dio/api/api_routers.dart';
import 'package:Y99/source/mvc/model/login_model.dart';
import 'package:Y99/source/mvc/model/register_model.dart';
import 'package:Y99/source/mvc/model/set_password_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  final _dio = Dio(BaseOptions(
    baseUrl: AppEndpoints.host,
    connectTimeout: const Duration(milliseconds: 120000),
    receiveTimeout: const Duration(milliseconds: 120000),
    extra: {'withCredentials': true},
  ));

//Gửi mật khẩu để lưu vào hệ thống
  Future<bool> setPassword(SetPasswordRequest request) async {
    try {
      final response = await _dio.post('/set-password', data: request.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print('Set password error: $e');
      return false;
    }
  }
//Gửi thông tin đăng nhập để lấy token/session
  Future<Response?> login(LoginModel request) async {
    try {
      final response = await _dio.post('/auth/login', data: request.toJson());
      return response;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
  //Gửi dữ liệu đăng ký tài khoản mới
  Future<Response> register(RegisterModel model) async {
    return await _dio.post(AppEndpoints.auth + AppEndpoints.register, data: model.toJson());
  }
}
