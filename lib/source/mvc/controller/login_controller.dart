import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:y99/core/app/theme/get_snack_bar.dart';
import 'package:y99/source/mvc/model/login_model.dart';
import 'package:y99/source/mvc/view/home/home_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  var obscurePassword = true.obs;

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Vui lòng nhập số điện thoại';
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) return 'Số điện thoại không hợp lệ';
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

  void login() {
          if (formKey.currentState!.validate()) {
            final request = LoginModel(
              phone: phoneController.text,
              password: passwordController.text,
            );
            final isLoginSuccessful = false;
            if (isLoginSuccessful) {
            }
            else if(request.phone == "1234567890" && request.password == "123456") {
              AppSnackBar.showSuccess("Đăng nhập thành công");
              Get.to(() => HomeScreen());
            }
            }
            else {
              AppSnackBar.showError("Tài khoản hoặc mật khẩu không chính xác");
            }
          }
        }

