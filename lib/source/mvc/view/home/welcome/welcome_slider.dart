import 'package:Y99/source/mvc/view/home/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeSlider extends StatelessWidget {
  const WelcomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WelcomeController>();

    return PageView(
      onPageChanged: (index) => controller.pageIndex.value = index,
      children: [
        Image.asset('assets/banner/bn1.jpg', fit: BoxFit.cover, width: double.infinity),
        Image.asset('assets/banner/bn2.jpg', fit: BoxFit.cover, width: double.infinity),
        Image.asset('assets/banner/bn3.jpg', fit: BoxFit.cover, width: double.infinity),
        Image.asset('assets/banner/bn4.jpg', fit: BoxFit.cover, width: double.infinity),
        Image.asset('assets/banner/bn5.jpg', fit: BoxFit.cover, width: double.infinity),
      ],
    );
  }
}
