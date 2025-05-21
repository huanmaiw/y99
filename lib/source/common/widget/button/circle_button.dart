import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.backgroundColor = Colors.grey,
    required this.child,
    required this.onTap,
    this.size = 40,
  });

  final Color backgroundColor;
  final Widget child;
  final Function() onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
