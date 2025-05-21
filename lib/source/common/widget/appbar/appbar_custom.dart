import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/text.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    this.title,
    this.bottom,
    this.onBackPressed,
    this.actions,
    bool? enableBackButton,
    this.centerTitle = true,
    this.titleWidget,
    this.leading,
    this.leadingWidth,
    this.backgroundColor = ResColor.blue,
  }) : enableBackButton = enableBackButton ?? false;

  final bool enableBackButton;
  final String? title;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool centerTitle;
  final Widget? leading;
  final double? leadingWidth;
  final Color backgroundColor;

  // Constants for different device sizes
  static const double _tabletWidthThreshold = 600.0;
  static const double _tabletToolbarHeight = 68.0;

  bool _isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > _tabletWidthThreshold;

  @override
  Widget build(BuildContext context) {
    final isTablet = _isTablet(context);

    // Adjust sizes based on device type
    final double backButtonMargin = isTablet ? 12.0 : 10.0;
    final double backButtonSize = isTablet ? 18.0 : 15.0;
    final double backButtonContainerMargin = isTablet ? 12.0 : 10.0;
    final double titleFontSize = isTablet ? ResTypography.h5 : ResTypography.h6;
    final double leadingPadding = isTablet ? 8.0 : 5.0;

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      toolbarHeight: isTablet ? _tabletToolbarHeight : kToolbarHeight,
      leading: enableBackButton
          ? Padding(
        padding: EdgeInsets.only(left: leadingPadding),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: onBackPressed,
          child: Container(
            margin: EdgeInsets.all(backButtonContainerMargin),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: backButtonSize,
              color: const Color(0xFF555555),
            ),
          ),
        ),
      )
          : leading,
      actions: actions,
      automaticallyImplyLeading: false,
      title: titleWidget ??
          Text(
            "$title",
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: ResTypography.semiBold,
              color: Colors.white,
            ),
          ),
      bottom: bottom,
      leadingWidth: leadingWidth,
      elevation: isTablet ? 2.0 : 0.0,
    );
  }

  @override
  Size get preferredSize {
    // Use a default height based on common device sizes
    // We can't directly access MediaQuery here without context
    const baseHeight = kToolbarHeight; // Default to standard height
    return Size.fromHeight(
      baseHeight + (bottom?.preferredSize.height ?? 0.0),
    );
  }
}
