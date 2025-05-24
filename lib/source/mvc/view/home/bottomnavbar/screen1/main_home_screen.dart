import 'package:Y99/core/app/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Y99/core/app/color/res_color.dart';

import 'main_home_controller.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainHomeController());

    return Scaffold(
      backgroundColor: ResColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Khoản vay", style: ResTypography.styleText),
            ),
          ],
        ),
      ),
    );
  }
}
