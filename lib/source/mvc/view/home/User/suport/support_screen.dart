import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  final VoidCallback onBack;

  const SupportScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tư vấn hỗ trợ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hỗ trợ khách hàng:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text('Hotline: 1900 1234'),
            Text('Email: support@y99.vn'),
            SizedBox(height: 20),
            Text(
              'Bạn có thể gửi câu hỏi hoặc khiếu nại qua email hoặc gọi hotline để được hỗ trợ nhanh nhất.',
            ),
          ],
        ),
      ),
    );
  }
}
