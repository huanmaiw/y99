import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/languages/app_key.dart';
import 'package:Y99/source/mvc/controller/verify_otp_controller.dart';
import 'package:Y99/source/mvc/view/otp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpController controller = Get.put(VerifyOtpController());
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Nhập số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: ResColor.blue),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              autofillHints: const [],
              onChanged: controller.onPhoneNumberChanged, // Cập nhật số điện thoại vào controller
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                  await controller.getOtp();
                  if (controller.otpCode.value.isNotEmpty) {
                    Get.to(() => VerifyOtpScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ResColor.blue,
                  disabledBackgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: ResColor.white)
                    : const Text(
                  'Gửi mã OTP',
                  style: TextStyle(color: ResColor.white),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        color: ResColor.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo/logo2.png", height: 50, width: 50),
            ],
          ),
          const SizedBox(height: 8),
          Text(AppKeys.slogan,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}