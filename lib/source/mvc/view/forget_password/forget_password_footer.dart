import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Y99/core/app/color/res_color.dart';

import 'forget_password_controller.dart';

class ForgetPasswordFooter extends StatelessWidget {
  const ForgetPasswordFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ResColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: controller.submit,
              child: const Text(
                "ĐĂNG NHẬP",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: ResColor.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ResColor.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Get.back(),
              child: const Text(
                "QUAY LẠI",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: ResColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
