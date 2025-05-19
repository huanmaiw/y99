import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:y99/core/app/theme/get_snack_bar.dart';
import 'package:y99/source/mvc/model/register_model.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();

  final selectedBirthDate = Rx<DateTime?>(null);
  final selectedGender = ''.obs;

  final isLoading = false.obs;

  void onRegister() async {
    if (_validate()) {
      isLoading.value = true;
      final user = RegisterModel(
        fullName: fullNameController.text,
        birthDate: birthDateController.text,
        phone: phoneController.text,
        gender: selectedGender.value,
      );

      try {
        print("Đăng ký với: ${user.toJson()}");
        Get.toNamed('/verify-otp');
      } catch (e) {
        AppSnackBar.showError("Không thể đăng ký");
      } finally {
        isLoading.value = false;
      }
    }
  }

  bool _validate() {
    if (fullNameController.text.isEmpty ||
        birthDateController.text.isEmpty ||
        phoneController.text.isEmpty ||
        selectedGender.value.isEmpty) {
      AppSnackBar.showError("Vui lòng điền đầy đủ thông tin");
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    genderController.dispose();
    super.onClose();
  }
}
