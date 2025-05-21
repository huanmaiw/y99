import 'package:flutter/material.dart';

class IndicatorHeaderBottomSheet extends StatelessWidget {
  const IndicatorHeaderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 100,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    );
  }
}
