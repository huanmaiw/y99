import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  final users = <UserModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
      var data = response.data as List;
      users.value = data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      Get.snackbar('Lỗi', 'Không thể tải danh sách');
    } finally {
      isLoading.value = false;
    }
  }
}
