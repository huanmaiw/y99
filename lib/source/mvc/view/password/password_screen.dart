import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/app_key.dart';
import 'package:Y99/source/mvc/controller/password_controller.dart';
import 'package:Y99/source/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              decoration: const BoxDecoration(
                                color: ResColor.blue,
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  Image.asset("assets/logo/logo2.png", height: 50, width: 50),
                                  const SizedBox(height: 8),
                                  Text(AppKeys.slogan,
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Thông tin cần thiết lập",
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
                              )
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
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "1. Mật khẩu phải có ít nhất 6 ký tự\n"
                                      "2. Bao gồm số hoặc kí tự đặc biệt\n"
                                      "3. Mật khẩu khớp.",
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // BUTTONS DƯỚI CÙNG
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ResColor.blue,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: ()=> Get.to(()=>HomeScreen()),
                        //controller.submitPassword,
                        child: const Text(
                          "ĐỒNG Ý",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ResColor.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ResColor.black,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => Get.back(),
                        child: const Text(
                          "QUAY LẠI",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ResColor.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }}
