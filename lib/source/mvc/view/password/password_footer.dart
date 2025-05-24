import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFooter extends StatelessWidget {
  final VoidCallback onSubmit;

  const PasswordFooter(this.onSubmit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              ResColor.blue,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
           // onPressed: onSubmit,
            onPressed: (){ Get.to(()=>HomeScreen());},
            child: const Text(
              "ĐỒNG Ý",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ResColor.white),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ResColor.black,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => Get.back(),
            child: const Text(
              "QUAY LẠI",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ResColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
