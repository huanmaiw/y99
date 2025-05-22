import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  var otpCode = ''.obs;
  var phoneNumber = ''.obs; // Biến lưu số điện thoại
  final otpTextController = TextEditingController();
  var isLoading = false.obs;
  final Dio dio = Dio();

  final String password = 'your_password'; // Có thể thay bằng input thực tế
  final String fullName = 'Your Full Name'; // Có thể thay bằng input thực tế

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
  }

  void onOtpChanged(String value) {
    otpCode.value = value;
  }

  /// Gửi lại mã OTP
  Future<void> resendOtp() async {
    if (phoneNumber.value.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng nhập số điện thoại");
      return;
    }

    try {
      isLoading.value = true;
      final response = await dio.get(
        'https://loanapi.y99.vn/otp/',
        queryParameters: {
          "username": phoneNumber.value,
          "password": password,
          "fullname": fullName,
          "auth_method": 2,
          "auth_status": 2,
          "register_method": 1,
        },
      );

      if (response.statusCode == 200) {
        String otp = response.data.toString();
        otpTextController.text = otp;
        otpCode.value = otp;
        Get.snackbar("Mã OTP mới", "OTP: $otp");
      } else {
        Get.snackbar("Lỗi", "Không nhận được mã OTP");
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Gửi lại mã OTP thất bại: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOtp() async {
    if (phoneNumber.value.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng nhập số điện thoại");
      return;
    }

    if (!RegExp(r'^\d{10,11}$').hasMatch(phoneNumber.value)) {
      Get.snackbar("Lỗi", "Số điện thoại không hợp lệ (10-11 chữ số)");
      return;
    }

    try {
      isLoading.value = true;
      final response = await dio.get(
        'https://loanapi.y99.vn/otp/',
        queryParameters: {
          "username": phoneNumber.value,
          "password": password,
          "fullname": fullName,
          "auth_method": 2,
          "auth_status": 2,
          "register_method": 1,
        },
      );

      if (response.statusCode == 200) {
        String otp = response.data.toString();
        otpTextController.text = otp;
        otpCode.value = otp;
        Get.snackbar("Thành công", "Mã OTP: $otp");
      } else {
        Get.snackbar("Lỗi", "Không lấy được mã OTP");
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Gọi API OTP thất bại: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    if (otpCode.value.isEmpty) {
      Get.snackbar("Lỗi", "Vui lòng nhập mã OTP");
      return;
    }

    if (!RegExp(r'^\d{6}$').hasMatch(otpCode.value)) {
      Get.snackbar("Lỗi", "Mã OTP phải là 6 chữ số");
      return;
    }
    isLoading.value = true;
    try {
      final response = await dio.post(
        'https://loanapi.y99.vn/verify-otp/',
        data: {
          "username": phoneNumber.value,
          "otp": otpCode.value,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        Get.toNamed('/password');
        Get.snackbar("Thành công", "Xác minh OTP thành công");
      } else {
        Get.snackbar("Lỗi", "Mã OTP không hợp lệ");
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Xác minh thất bại: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    otpTextController.dispose();
    super.onClose();
  }
}