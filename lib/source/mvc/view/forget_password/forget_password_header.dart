import 'package:flutter/material.dart';
import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/languages/app_key.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
