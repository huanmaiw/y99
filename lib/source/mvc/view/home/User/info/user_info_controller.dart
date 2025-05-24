import 'package:Y99/source/mvc/view/home/User/info/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserInfoController extends GetxController {
  final user = UserModel().obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final idCardController = TextEditingController();
  final issueDateController = TextEditingController();
  final issuePlaceController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();

  void saveUserInfo() {
    user.update((val) {
      val?.name = nameController.text;
      val?.phone = phoneController.text;
      val?.idCard = idCardController.text;
      val?.issueDate = issueDateController.text;
      val?.issuePlace = issuePlaceController.text;
      val?.city = cityController.text;
      val?.district = districtController.text;
      val?.address = addressController.text;
    });

    // Hiển thị thông báo
    Get.snackbar("Thành công", "Đã lưu thông tin người dùng");
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    idCardController.dispose();
    issueDateController.dispose();
    issuePlaceController.dispose();
    cityController.dispose();
    districtController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
