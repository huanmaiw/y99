import 'package:Y99/core/app/app_get/get_snack_bar.dart';
import 'package:Y99/core/auth/auth_service.dart';
import 'package:Y99/source/mvc/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/auth/api_service.dart';
import '../view/home/list_user/user_list_screen.dart';

class RegisterController extends GetxController {
 //  final fullNameController = TextEditingController();
 //  final passwordController = TextEditingController();
 // // final birthDateController = TextEditingController();
 // // final phoneController = TextEditingController();
 // // final genderController = TextEditingController();
 //  final emailController = TextEditingController();
 //
 //  final selectedBirthDate = Rx<DateTime?>(null);
 //  final selectedGender = ''.obs;
 //
    final isLoading = false.obs;
 //
 //  void onRegister() async {
 //    if (_validate()) {
 //      isLoading.value = true;
 //      final user = RegisterModel(
 //        fullname: fullNameController.text,
 //        phone: phoneController.text,
 //        email: "${emailController.text}@y99.vn",
 //      );
 //
 //      try {
 //        final response = await AuthService().register(user);
 //        if (response.statusCode == 200) {
 //          AppSnackBar.showSuccess("Đăng ký thành công");
 //          Get.toNamed('/verify-otp');
 //        } else {
 //          AppSnackBar.showError("Đăng ký thất bại");
 //        }
 //      } catch (e) {
 //        AppSnackBar.showError("Lỗi: ${e.toString()}");
 //      } finally {
 //        isLoading.value = false;
 //      }
 //    }
 //  }
 //
 //
 //  bool _validate() {
 //    if (fullNameController.text.isEmpty ||
 //        birthDateController.text.isEmpty ||
 //        phoneController.text.isEmpty ||
 //        emailController.text.isEmpty ||
 //        selectedGender.value.isEmpty) {
 //      AppSnackBar.showError("Vui lòng điền đầy đủ thông tin");
 //      return false;
 //    }
 //    return true;
 //  }
 //
 //  @override
 //  void onClose() {
 //    fullNameController.dispose();
 //    birthDateController.dispose();
 //    phoneController.dispose();
 //    emailController.dispose();
 //    genderController.dispose();
 //    super.onClose();
 //  }
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _api = UserApiService();

  void register(BuildContext context) async {
    final user = await _api.registerUser(
      username: usernameController.text,
      password: passwordController.text,
      fullname: emailController.text,
    );
    if (user != null) {
        AppSnackBar.showSuccess("Đăng kí thành công");
        Get.to(() => UserListScreen());
    } else {
      AppSnackBar.showError("Đăng kí thất bại");
    }
  }

}
