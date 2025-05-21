import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBottomSheet extends StatelessWidget {
  final String title;

  const HeaderBottomSheet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ResColor.lightGrey,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(ResPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
