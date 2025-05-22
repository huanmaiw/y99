import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.white, // Nền nhẹ
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField("Họ và tên", "Nhập họ và tên"),
            _buildField("Số điện thoại", "Nhập số điện thoại"),
            _buildField("Giấy tờ vay/ Cầm cố", "Nhập CCCD/CMND"),
            _buildField("Ngày cấp", "dd/mm/yyyy"),
            _buildField("Nơi cấp", "Nơi cấp"),
            _buildField("Tỉnh/Thành phố", "Nhập tỉnh/thành phố"),
            _buildField("Quận/ Huyện", "Nhập quận/huyện"),
            _buildField("Địa chỉ chi tiết", "Số nhà, đường/ thôn, xóm"),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Lưu thông tin
                },
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

  Widget _buildField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              )),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
