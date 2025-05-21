import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';

import 'custom_box.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkColor = Colors.white,
    this.tristate = false,
    required this.child,
    this.borderRadius = 8.0,
    this.selectedBorderWidth = 2.0,
    this.checkmarkSize = 18.0,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color checkColor;
  final bool tristate;
  final Widget child;
  final double borderRadius;
  final double selectedBorderWidth;
  final double checkmarkSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () => onChanged(!value),
        child: CustomBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: value ? ResColor.blue : Colors.grey.shade300,
              width: value ? selectedBorderWidth : 1.0,
            ),
          ),
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              children: [
                child,
                if (value)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: ResColor.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(borderRadius),
                        ),
                      ),
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top: 6, right: 6),
                      child: Icon(
                        Icons.check,
                        size: checkmarkSize,
                        color: checkColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
