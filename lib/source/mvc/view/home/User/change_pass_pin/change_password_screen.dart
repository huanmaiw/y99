import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePasswordScreen extends StatelessWidget {
  final VoidCallback onBack;

  const ChangePasswordScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ResColor.splash,
        //title: const Text('Thay đổi mật khẩu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Nhập mã OTP đã gửi đến số điện thoại của bạn",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ResColor.blue)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: PinCodeTextField(
                //controller: controller.otpTextController,
                appContext: context,
                length: 6,
                //onChanged: controller.onOtpChanged,
                //onCompleted: (value) => controller.verifyOtp(),
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
            const SizedBox(height: 30),
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
                    // Get.snackbar(
                    //   "Thành công",
                    //   "Xác thực mã OTP thành công",
                    //   snackPosition: SnackPosition.BOTTOM,
                    //   backgroundColor: Colors.blue,
                    //   colorText: Colors.white,
                    //   duration: const Duration(seconds: 1), // Thời gian hiển thị
                    // );
                   // Get.to(() => PasswordScreen());
                  },
                  child:
                  // controller.isLoading.value
                  //     ? const CircularProgressIndicator(color: ResColor.white)
                  //     : const
                  Text(
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
        ),
      ),
    );
  }
}
