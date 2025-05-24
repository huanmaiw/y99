import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/languages/app_key.dart';
import 'package:Y99/source/mvc/controller/login_controller.dart';
import 'package:Y99/source/mvc/view/forget_password/forget_password_screen.dart';
import 'package:Y99/source/mvc/view/otp/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Đăng nhập",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 16),

          // Form
          Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.phoneController,
                    validator: controller.validatePhone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle, color: Colors.grey),
                      hintText: "Số điện thoại",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.obscurePassword.value,
                    validator: controller.validatePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      hintText: "Nhập mật khẩu",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      child: const Text("Quên mật khẩu?",
                          style: TextStyle(color: Colors.orange)),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                      onPressed: controller.login,
                      child: const Text("ĐĂNG NHẬP",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ResColor.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Social login
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 30),
          //     const SizedBox(width: 30),
          //     Image.asset("assets/icon/gg.png", width: 40, height: 40),
          //     const SizedBox(width: 30),
          //     const Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 30),
          //   ],
          // ),
          //
          // const SizedBox(height: 20),

          // Register
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bạn chưa có tài khoản? "),
              GestureDetector(
                onTap: () => Get.to(() => VerifyOtp()),
                child: const Text("Đăng ký",
                    style: TextStyle(
                        color: Color(0xFF00B140), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
