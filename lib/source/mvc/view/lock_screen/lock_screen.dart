import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

import 'lock_controller.dart';

class LockScreen extends StatelessWidget {
  LockScreen({super.key});
  final lockController = Get.put(LockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/logo/logo1.png",
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "Chào buổi sáng",
              style: GoogleFonts.lato(fontSize: 20),
            ),
            const SizedBox(width: 8),
            Text(
              lockController.userName.value,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
      body: Column(
        children: [
          Container(
            height: 30,
            color: ResColor.white,
            child: Obx(() => Marquee(
              text: lockController.slogan.value,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ResColor.blue,
              ),
              scrollAxis: Axis.horizontal,
              blankSpace: 60.0,
              velocity: 40.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ResColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              ),
              onPressed: () {
                Get.to(() => LoginScreen());
              },
              child: Text(
                "Đăng nhập",
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Dù bạn ở đâu thì chúng tôi vẫn luôn sẵn sàng",
                      style: TextStyle(
                        color: ResColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Với các gói vay linh hoạt, nhanh chóng và minh bạch, chúng tôi đồng hành cùng bạn chinh phục mọi mục tiêu cuộc sống",
                      style: TextStyle(
                        color: ResColor.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ResColor.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: const Text(
                          "Vay nhanh với Y99",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ResColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: ResColor.blue, width: 2),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: const Text(
                          "Cầm đồ với Y99",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  buildSection("Hướng dẫn sử dụng"),
                  buildSection("Hướng dẫn bảo mật"),
                  buildSection("Liên hệ với chúng tôi"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
