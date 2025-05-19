import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:y99/core/auth/auth_service.dart';
import 'package:y99/source/mvc/model/set_password_model.dart';
import 'package:y99/source/mvc/view/home/welcome_screen.dart';

class PasswordController extends GetxController {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final obscureNewPassword = true.obs;
  final obscureConfirmPassword = true.obs;

  void toggleObscureNew() => obscureNewPassword.value = !obscureNewPassword.value;
  void toggleObscureConfirm() => obscureConfirmPassword.value = !obscureConfirmPassword.value;

  void submitPassword() async {
    final newPw = newPassword.text.trim();
    final confirmPw = confirmPassword.text.trim();

    if (newPw.length < 6 || newPw != confirmPw) {
      Get.snackbar("Lỗi", "Mật khẩu không hợp lệ hoặc không khớp.");
      return;
    }

    final request = SetPasswordRequest(password: newPw);
    final success = await AuthService().setPassword(request);
    if (success) {
      Get.offAll(() => const WelcomeScreen());
    } else {
      Get.snackbar("Lỗi", "Thiết lập mật khẩu thất bại");
    }
  }
}
