import 'package:dio/dio.dart';
import 'package:y99/source/mvc/model/set_password_model.dart';

class AuthService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://yourapi.com/api'));

  Future<bool> setPassword(SetPasswordRequest request) async {
    try {
      final response = await _dio.post('/set-password', data: request.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print('Set password error: $e');
      return false;
    }
  }
}
