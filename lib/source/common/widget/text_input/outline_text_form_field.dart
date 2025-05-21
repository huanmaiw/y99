// ignore_for_file: prefer_const_constructors

import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlineTextFormField extends StatelessWidget {
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
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final String? hintText;
  final bool autoFocus;
  final Widget? label;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? labelText;
  final Widget? error;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? style;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autovalidateMode;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const OutlineTextFormField({
    super.key,
    this.controller,
    this.minLines = 1,
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
    this.errorBorder,
    this.mouseCursor,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.autoFocus = false,
    this.showCursor,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    this.hintText,
    this.label,
    this.hintStyle,
    this.labelStyle,
    this.floatingLabelBehavior,
    this.labelText,
    this.error,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.style,
    this.suffixIconConstraints,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      onTap: onTap,
      style: style,
      minLines: minLines,
      validator: validator,
      autovalidateMode: autovalidateMode,
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
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      showCursor: showCursor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        contentPadding: contentPadding,
        filled: true,
        fillColor: fillColor ?? Colors.white,
        hintText: hintText,
        label: label,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        labelText: labelText,
        floatingLabelBehavior: floatingLabelBehavior,
        error: error,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(ResRadius.r10),
        ),
        errorBorder: errorBorder,
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ResColor.borderColor),
              borderRadius: BorderRadius.circular(ResRadius.r10),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ResColor.borderColor),
              borderRadius: BorderRadius.circular(ResRadius.r10),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ResColor.blue),
              borderRadius: BorderRadius.circular(ResRadius.r10),
            ),
      ),
    );
  }
}
