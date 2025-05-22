import 'package:dio/dio.dart';
import '../../source/mvc/model/user_model.dart';
// đăng kí người dùng với api y99 ko dùng đến
class UserApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.y99.vn/data/User/';

  Future<UserModel?> registerUser({
    required String username,
    required String password,
    required String fullname,
  }) async {
    try {
      final response = await _dio.post(
        baseUrl,
        data: {
          "username": username,
          "password": password,
          "fullname": fullname,
          "auth_method": 2,
          "auth_status": 2,
          "register_method": 1,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        print('Lỗi khi đăng ký: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      print('❌ Lỗi tạo user: $e');
    }
    return null;
  }
}
