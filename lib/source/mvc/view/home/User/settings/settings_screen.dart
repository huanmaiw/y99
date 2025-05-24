import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final VoidCallback onBack;

  const SettingScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Thông báo'),
            value: true,
            onChanged: (val) {
              // TODO: xử lý thay đổi
            },
          ),
          ListTile(
            title: const Text('Ngôn ngữ'),
            subtitle: const Text('Tiếng Việt'),
            onTap: () {
              // TODO: chọn ngôn ngữ
            },
          ),
          // Thêm các option khác ở đây...
        ],
      ),
    );
  }
}
