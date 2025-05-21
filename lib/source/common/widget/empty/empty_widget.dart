import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Assets.animations.emptyEvent.lottie(width: 250, fit: BoxFit.cover),
          if (child != null) child!,
          if (child == null)
            const Text(
              'Không có dữ liệu',
              style: TextStyle(
                fontSize: 16,
                color: ResColor.lightGrey,
              ),
            ),
        ],
      ),
    );
  }
}
