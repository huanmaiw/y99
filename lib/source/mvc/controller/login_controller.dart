import 'package:Y99/core/app/app_get/get_snack_bar.dart';
import 'package:Y99/source/mvc/model/login_model.dart';
import 'package:Y99/source/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final storage = GetStorage();

  var obscurePassword = true.obs;

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Vui lòng nhập số điện thoại hoặc email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Vui lòng nhập mật khẩu';
    if (value.length < 6) return 'Mật khẩu phải từ 6 ký tự';
    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // void login() async {
  //   if (formKey.currentState!.validate()) {
  //     try {
  //       final dio = AppDio.instance.provideDio();
  //
  //       final loginModel = LoginModel(
  //         phone: phoneController.text.trim(),
  //         password: passwordController.text,
  //       );
  //
  //       final response = await dio.post(
  //         AppEndpoints.host,
  //         data: loginModel.toJson(),
  //       );
  //
  //       if (response.statusCode == 200 && response.data["token"] != null) {
  //         final token = response.data["token"];
  //         await storage.write("token", token);
  //         AppSnackBar.showSuccess("Đăng nhập thành công");
  //         Get.offAll(() => const HomeScreen());
  //       } else {
  //         AppSnackBar.showError("Sai tài khoản hoặc mật khẩu");
  //       }
  //     } catch (e) {
  //       AppSnackBar.showError("Lỗi đăng nhập: ${e.toString()}");
  //     }
  //   }
  // }
  void login() async {
    if (phoneController.text == "maihuan" && passwordController.text == "123456") {
      await Future.delayed(const Duration(milliseconds: 1500));
      AppSnackBar.showSuccess("Đăng nhập thành công");
      Get.offAll(() => HomeScreen());
    } else {
      AppSnackBar.showError("Sai tài khoản hoặc mật khẩu");
    }
  }

}
