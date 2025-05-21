import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness = 0.5, this.indent = 0});

  final double thickness;
  final double indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      height: 0,
      indent: indent,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
