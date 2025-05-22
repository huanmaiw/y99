import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../password/password_screen.dart';

class VerifyOtpForm extends StatelessWidget {
  final controller = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text(
          "Nhập mã xác nhận",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text("Mã xác nhận đã được gửi đến số điện thoại của bạn."),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: PinCodeTextField(
            controller: controller.otpTextController,
            appContext: context,
            length: 6,
            onChanged: controller.onOtpChanged,
            onCompleted: (value) => controller.verifyOtp(),
            keyboardType: TextInputType.number,
            autoFocus: true,
            enableActiveFill: false,
            enablePinAutofill: false, // Tắt autofill
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: MediaQuery.of(context).size.width * 0.11,
              fieldWidth: MediaQuery.of(context).size.width * 0.11,
              activeColor: Colors.green,
              selectedColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bạn không nhận được mã?"),
            TextButton(
              onPressed: controller.resendOtp,
              child: const Text("Gửi lại", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() => SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ResColor.blue,
                disabledBackgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  "Thành công",
                  "Xác thực mã OTP thành công",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 1), // Thời gian hiển thị
                );
                Get.to(() => PasswordScreen());
              },
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: ResColor.white)
                  : const Text(
                "XÁC NHẬN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ResColor.white,
                ),
              ),
            ),
          )),
        ),

      ],
    );
  }
}