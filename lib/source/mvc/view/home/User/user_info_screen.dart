import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
            _buildField("Địa chỉ chi tiết", "Số nhà, đường/ thôn,xóm"),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
