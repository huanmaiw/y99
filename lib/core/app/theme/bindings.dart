import 'package:get/get.dart';
import 'package:y99/source/mvc/controller/login_controller.dart';
import 'package:y99/source/mvc/controller/register_controller.dart';
import 'package:y99/source/mvc/controller/verify_otp_controller.dart';
import 'package:y99/source/mvc/controller/password_controller.dart';

class AppBindings {
  static void dependencies() {
    // Global bindings nếu có thể dùng toàn app (ít khi dùng)
    // Get.put(AuthService()); // ví dụ
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => VerifyOtpController());
    Get.lazyPut(() => PasswordController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpController());
  }
}

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }
}
class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }
}
