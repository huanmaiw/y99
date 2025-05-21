import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';

class EmptyWidget2 extends StatelessWidget {
  const EmptyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Assets.animations.emptyEvent2
        //     .lottie(height: 100, width: 100, fit: BoxFit.cover),
        const Text(
          'Không có sự kiện',
          style: TextStyle(
            fontSize: 16,
            color: ResColor.lightGrey,
          ),
        ),
      ],
    );
  }
}
