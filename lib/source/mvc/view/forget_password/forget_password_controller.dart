import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final emailOrPhoneController = TextEditingController();

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    super.onClose();
  }

  void submit() {
    // TODO: Gửi yêu cầu quên mật khẩu (API)
    print('Yêu cầu quên mật khẩu cho: ${emailOrPhoneController.text}');
  }
}
