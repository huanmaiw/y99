import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'get_pages.dart';
import 'theme_app.dart';

class GetApp extends StatelessWidget {
  const GetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lunar Calendar Event',
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splash,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('vi', 'VN'),
      // ],
      // showPerformanceOverlay: kDebugMode,
      defaultTransition: Transition.cupertino,
      getPages: GetPages.pages,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
      popGesture: true,
      //initialBinding: AppBindings(),
    );
  }
}
