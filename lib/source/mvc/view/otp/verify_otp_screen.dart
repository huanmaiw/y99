import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/app_key.dart';
import 'package:Y99/source/mvc/controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verify_otp_form.dart';


class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyOtpController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                        Image.asset("assets/logo/logo2.png", height: 50, width: 50),
                        const SizedBox(height: 8),
                        Text(AppKeys.slogan,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: VerifyOtpForm(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
