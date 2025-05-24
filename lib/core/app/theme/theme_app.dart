import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/res/radius.dart';
import 'package:Y99/core/app/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: ResColor.backgroundColor,
    fontFamily: GoogleFonts.inter().fontFamily,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ResRadius.r10),
          topRight: Radius.circular(ResRadius.r10),
        ),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: ResColor.blue,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ResRadius.r10),
        ),
      ),
      titleTextStyle: TextStyle(
        fontWeight: ResTypography.semiBold,
        fontSize: ResTypography.h7,
        color: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ResRadius.r10),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll<Color>(Colors.black),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF9FAFB),
    ),
  );
}
// class MyApp extends StatelessWidget {
//   final Rx<ThemeMode> _themeMode = ThemeMode.light.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'My App',
//         translations: AppTranslations(),
//         locale: Locale('vi', 'VN'),
//         fallbackLocale: Locale('en', 'US'),
//         theme: AppTheme.lightTheme,
//         darkTheme: AppTheme.darkTheme,
//         themeMode: _themeMode.value,
//         home: HomeScreen(
//         onToggleTheme: () {
//     _themeMode.value =
//     _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     },
// actions: [
// IconButton(
// icon: Icon(Icons.brightness_6),
// onPressed: onToggleTheme,
// ),
// ],