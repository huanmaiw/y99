import 'package:Y99/core/app/res/padding.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final Widget child;
  final Decoration decoration;
  final EdgeInsetsGeometry padding;

  const CustomBox._({
    super.key,
    required this.child,
    required this.decoration,
    required this.padding,
  });

  factory CustomBox({
    required Widget child,
    Decoration? decoration,
    EdgeInsetsGeometry? padding,
    Key? key,
  }) {
    decoration ??= const BoxDecoration(
      color: Colors.white,
    );
    padding ??= EdgeInsets.all(ResPadding.p8);
    return CustomBox._(
      key: key,
      decoration: decoration,
      padding: padding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
