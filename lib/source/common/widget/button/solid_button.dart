import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/padding.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class SolidButton extends StatelessWidget {
  final Function()? onTap;
  final double height;
  final Icon? icon;
  final Widget? iconImage;
  final String title;
  final TextStyle textStyle;
  final double imageIconSize;
  final BoxFit fit;
  final Widget? trial;
  final Decoration decoration;

  const SolidButton._({
    super.key,
    this.onTap,
    required this.height,
    this.icon,
    this.iconImage,
    required this.title,
    required this.textStyle,
    required this.imageIconSize,
    required this.fit,
    this.trial,
    required this.decoration,
  });

  factory SolidButton({
    Key? key,
    Function()? onTap,
    double height = 50.0,
    Icon? icon,
    Widget? iconImage,
    required String title,
    TextStyle? textStyle,
    double imageIconSize = 24.0,
    BoxFit fit = BoxFit.contain,
    Widget? trial,
    Decoration? decoration,
  }) {
    final defaultDecoration = BoxDecoration(
      color: ResColor.blue,
      borderRadius: BorderRadius.circular(ResRadius.r10),
    );

    const defaultTextStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
    return SolidButton._(
      key: key,
      onTap: onTap,
      height: height,
      icon: icon,
      decoration: decoration ?? defaultDecoration,
      iconImage: iconImage,
      title: title,
      textStyle: textStyle ?? defaultTextStyle,
      imageIconSize: imageIconSize,
      fit: fit,
      trial: trial,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: decoration,
        padding:
            const EdgeInsets.symmetric(horizontal: ResPadding.p4, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: icon != null
                    ? icon!
                    : iconImage != null
                        ? iconImage!
                        : Container()),
            Expanded(
              flex: 3,
              child: AutoSizeText(
                title,
                style: textStyle,
                maxLines: 2,
                maxFontSize: 14.0,
                minFontSize: 8.0,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(flex: 1, child: trial != null ? trial! : Container()),
          ],
        ),
      ),
    );
  }
}
