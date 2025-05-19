import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  var otpCode = ''.obs;
  var isLoading = false.obs;

  void onOtpChanged(String value) {
    otpCode.value = value;
  }

  void resendOtp() {
    // TODO: Gọi API gửi lại mã OTP
    print("Resend OTP requested");
  }

  Future<void> verifyOtp() async {
    isLoading.value = true;
    try {
      // TODO: Gọi API xác minh mã OTP tại đây
      await Future.delayed(const Duration(seconds: 1));
      // Nếu thành công: chuyển sang màn hình nhập mật khẩu
      Get.toNamed('/password');
    } catch (e) {
      Get.snackbar("Lỗi", "Xác minh thất bại");
    } finally {
      isLoading.value = false;
    }
  }
}
