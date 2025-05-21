import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/insert.dart';
import 'package:Y99/core/app/res/text.dart';
import 'package:flutter/material.dart';

import 'outline_text_form_field.dart';


class OutlineLabelTextFormField extends StatelessWidget {
  const OutlineLabelTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.readOnly = false,
    this.required = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.obscureText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool? obscureText;
  final bool required;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: labelText,
                  style: ResTypography.titleStyleBold,
                ),
                if (required)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
        ResInset.g8,
        OutlineTextFormField(
          controller: controller,
          hintText: hintText,
          validator: validator,
          obscureText: obscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          suffixIcon: readOnly
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: ResColor.placeholderColor,
                    size: 16,
                  ),
                )
              : suffixIcon,
        )
      ],
    );
  }
}
