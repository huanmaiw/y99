import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Y99/source/mvc/controller/password_controller.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasswordController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Nhập thông tin",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Họ và tên",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => TextField(
            controller: controller.newPassword,
            obscureText: controller.obscureNewPassword.value,
            decoration: InputDecoration(
              hintText: "Mật khẩu",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscureNewPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.toggleObscureNew,
              ),
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => TextField(
            controller: controller.confirmPassword,
            obscureText: controller.obscureConfirmPassword.value,
            decoration: InputDecoration(
              hintText: "Nhập lại mật khẩu",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscureConfirmPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.toggleObscureConfirm,
              ),
            ),
          )),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "1. Mật khẩu phải có ít nhất 6 ký tự\n"
                "2. Bao gồm số hoặc kí tự đặc biệt\n"
                "3. Mật khẩu khớp.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
