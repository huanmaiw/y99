import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/app/bindings/bindings.dart';
import 'core/app/app_get/get_pages.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await _requestNotificationPermission();
  AppBindings.dependencies();
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: true, // hoặc !kReleaseMode để bật chỉ debug
      builder: (context) => const MyApp(),
    ),
  );

 // const MyApp());
}
// Future<void> _requestNotificationPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('Đã cấp quyền thông báo');
//   } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
//     print('Người dùng từ chối thông báo');
//   } else if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
//     print('Người dùng chưa quyết định');
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Y99 App',
      initialBinding: MainBinding(),
      initialRoute: Routers.splash,
      getPages: GetPages.pages,
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
      ),
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
    );
  }
}
