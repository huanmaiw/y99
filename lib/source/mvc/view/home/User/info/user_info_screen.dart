import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Y99/core/app/color/res_color.dart';

import 'user_info_controller.dart';
import 'user_info_field.dart';


class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserInfoController());

    return Scaffold(
      backgroundColor: ResColor.white,
      // appBar: AppBar(
      //   title: const Text('Thông tin người dùng'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () => Get.back(),
      //   ),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0.5,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfoField(label: "Họ và tên", hint: "Nhập họ và tên", controller: controller.nameController),
            UserInfoField(label: "Số điện thoại", hint: "Nhập số điện thoại", controller: controller.phoneController),
            UserInfoField(label: "Giấy tờ vay/ Cầm cố", hint: "Nhập CCCD/CMND", controller: controller.idCardController),
            UserInfoField(label: "Ngày cấp", hint: "dd/mm/yyyy", controller: controller.issueDateController),
            UserInfoField(label: "Nơi cấp", hint: "Nơi cấp", controller: controller.issuePlaceController),
            UserInfoField(label: "Tỉnh/Thành phố", hint: "Nhập tỉnh/thành phố", controller: controller.cityController),
            UserInfoField(label: "Quận/ Huyện", hint: "Nhập quận/huyện", controller: controller.districtController),
            UserInfoField(label: "Địa chỉ chi tiết", hint: "Số nhà, đường/ thôn, xóm", controller: controller.addressController),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: controller.saveUserInfo,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Lưu thông tin",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
