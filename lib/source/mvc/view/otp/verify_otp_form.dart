import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpForm extends StatelessWidget {
  final controller = Get.find<VerifyOtpController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        const Text("Nhập mã xác nhận",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: Colors.green,
              selectedColor: Colors.green,
              inactiveColor: Colors.grey,
            ),
          ),
        ),
       // const SizedBox(height: 16),
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
       // const SizedBox(height: 24),
        Obx(() => SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ResColor.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: controller.isLoading.value ? null : controller.verifyOtp,
            child: controller.isLoading.value
                ? const CircularProgressIndicator(color: ResColor.blue)
                : const Text("XÁC NHẬN",
            style: TextStyle(
                       fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ResColor.white)
            ),

          ),
        )),
      ],
    );
  }
}
