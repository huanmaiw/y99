// lib/source/mvc/view/password/components/pin_code_input.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:Y99/source/mvc/controller/password_controller.dart';

class PinPassword extends StatelessWidget {
  const PinPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasswordController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "Tạo mã PIN",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: controller.pinCodeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.blue,
                selectedColor: Colors.blue,
                inactiveColor: Colors.grey,
                borderWidth: 2,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {
                if (value.length == 6) {
                  controller.pinError.value = '';
                }
              },
              onCompleted: (value) {
                controller.pinError.value = '';
              },
            ),
            if (controller.pinError.value.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  controller.pinError.value,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        )),
      ],
    );
  }
}
