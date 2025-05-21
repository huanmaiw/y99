import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:Y99/core/app/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderlineTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final Clip clipBehavior;
  final bool? enabled;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final MouseCursor? mouseCursor;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? showCursor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final String? hintText;
  final Widget? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? labelText;
  final Widget? error;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? style;
  final BoxConstraints? suffixIconConstraints;
  final String? textLabel;
  final TextStyle? styleTextLabel;

  const UnderlineTextFormField({
    super.key,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.onTap,
    this.validator,
    this.textAlignVertical,
    this.textAlign = TextAlign.start,
    this.clipBehavior = Clip.hardEdge,
    this.maxLines = 1,
    this.enabled,
    this.cursorColor,
    this.focusNode,
    this.maxLength,
    this.textInputAction,
    this.mouseCursor,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.showCursor,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding = EdgeInsets.zero,
    this.fillColor = Colors.white,
    this.hintText,
    this.label,
    this.hintStyle,
    this.labelStyle,
    this.labelText,
    this.error,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.style,
    this.suffixIconConstraints,
    this.textLabel,
    this.styleTextLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textLabel != null
            ? Text(
                textLabel!,
                style: styleTextLabel ?? ResTypography.titleStyle,
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          onTap: onTap,
          style: style,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          textAlignVertical: textAlignVertical,
          textAlign: textAlign,
          clipBehavior: clipBehavior,
          enabled: enabled,
          cursorColor: cursorColor,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: textInputAction,
          mouseCursor: mouseCursor,
          keyboardType: keyboardType,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          showCursor: showCursor,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            contentPadding: contentPadding,
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            label: label,
            hintStyle: hintStyle,
            labelStyle: labelStyle,
            labelText: labelText,
            error: error,
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(ResRadius.r10),
            ),
            border: border ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: ResColor.borderColor),
                ),
            enabledBorder: enabledBorder ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: ResColor.borderColor),
                ),
            focusedBorder: focusedBorder ??
                const UnderlineInputBorder(
                  borderSide: BorderSide(color: ResColor.blue),
                ),
          ),
        ),
      ],
    );
  }
}
