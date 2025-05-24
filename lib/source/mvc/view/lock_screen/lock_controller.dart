import 'package:get/get.dart';

class LockController extends GetxController {
  // Giả định có dữ liệu từ API (tên người dùng, khẩu hiệu...)
  var userName = "Kiệu Mai Huấn".obs;
  var slogan = "Y99 là nền tảng hỗ trợ tài chính uy tín chuyên cung cấp dịch vụ cho vay cấp tốc, cầm đồ online minh bạch, an toàn và tiện lợi".obs;

  // TODO: Thêm gọi API tại đây
  Future<void> fetchUserData() async {
    try {
      // TODO: Gọi API lấy tên người dùng...
      // final response = await Dio().get(...);
      // userName.value = response.data['name'];
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }
}
