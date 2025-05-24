import 'package:Y99/core/app/theme/languages/vi_languages.dart';
import 'package:get/get.dart';

import 'en_languages.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'US': en,
    'VN': vi,
  };
}
//Text('hello'.tr); // Tự động dịch theo locale hiện tại
// GetMaterialApp(
// translations: AppTranslations(), // bạn đã tạo ở trên
// locale: Locale('vi', 'VN'), // Ngôn ngữ mặc định
// fallbackLocale: Locale('en', 'US'), // Ngôn ngữ dự phòng
// home: YourHomeScreen(),
// );
