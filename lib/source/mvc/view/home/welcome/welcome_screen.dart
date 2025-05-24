import 'package:Y99/source/mvc/view/home/welcome/welcome_content.dart';
import 'package:Y99/source/mvc/view/home/welcome/welcome_controller.dart';
import 'package:Y99/source/mvc/view/home/welcome/welcome_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: const [
          Expanded(child: WelcomeSlider()),
          SizedBox(height: 20),
          WelcomeContent(),
        ],
      ),
    );
  }
}
