import 'package:get/get.dart';

class MainHomeController extends GetxController {
  final banners = [
    'assets/banner/bn1.jpg',
    'assets/banner/bn2.jpg',
    'assets/banner/bn3.jpg',
    'assets/banner/bn4.jpg',
    'assets/banner/bn5.jpg',
  ];

  final currentBannerIndex = 0.obs;

  void changeBanner(int index) {
    currentBannerIndex.value = index;
  }
}
