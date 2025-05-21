import 'package:dio/dio.dart';

import '../../source/mvc/model/user_model.dart';


class UserService {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await _dio.get('https://api.y99.vn/data/User/?format=json');

      final data = response.data;
      final List usersJson = data['rows'];

      return usersJson.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      print('Lỗi khi lấy user: $e');
      return [];
    }
  }
  Future<void> getUsers() async {
    try {
      final response = await _dio.get("https://api.y99.vn/data/User/?format=json");

      print(response.data); // hiện dữ liệu trong console
    } catch (e) {
      print("Lỗi khi gọi API: $e");
    }
  }
}
