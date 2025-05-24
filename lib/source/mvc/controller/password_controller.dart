import 'package:Y99/core/auth/auth_service.dart';
import 'package:Y99/source/mvc/model/set_password_model.dart';
import 'package:Y99/source/mvc/view/home/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final pinCodeController = TextEditingController();
  final pinError = ''.obs;

  final obscureNewPassword = true.obs;
  final obscureConfirmPassword = true.obs;

  void toggleObscureNew() => obscureNewPassword.value = !obscureNewPassword.value;
  void toggleObscureConfirm() => obscureConfirmPassword.value = !obscureConfirmPassword.value;

  String get pinCode => pinCodeController.text.trim();

  void submitPassword() async {
    final newPw = newPassword.text.trim();
    final confirmPw = confirmPassword.text.trim();
    final pin = pinCodeController.text.trim();

    if (newPw.length < 6 || newPw != confirmPw) {
      Get.snackbar("Lỗi", "Mật khẩu không hợp lệ hoặc không khớp.");
      return;
    }

    if (pin.length != 6 || pin.contains(RegExp(r'[^0-9]'))) {
      pinError.value = "Mã PIN phải gồm 6 số.";
      return;
    } else {
      pinError.value = '';
    }

    final request = SetPasswordRequest(password: newPw);
    final success = await AuthService().setPassword(request);
    if (success) {
      Get.offAll(() => WelcomeScreen());
    } else {
      Get.snackbar("Lỗi", "Thiết lập mật khẩu thất bại");
    }
  }

  @override
  void onClose() {
    newPassword.dispose();
    confirmPassword.dispose();
    pinCodeController.dispose();
    super.onClose();
  }
}
