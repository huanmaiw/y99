import 'package:flutter/material.dart';

class TermsAndService extends StatelessWidget {
  final VoidCallback onBack;

  const TermsAndService({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điều khoản và dịch vụ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: const Text(
          '''
1. Điều khoản sử dụng dịch vụ
- Người dùng phải tuân thủ các quy định...
- Không được phép sử dụng dịch vụ cho mục đích phi pháp...

2. Chính sách bảo mật
- Y99 cam kết bảo vệ thông tin cá nhân người dùng...
- Thông tin sẽ không được chia sẻ cho bên thứ ba...

3. Quyền và trách nhiệm
- Người dùng có quyền truy cập và chỉnh sửa thông tin cá nhân...
- Y99 có quyền tạm ngừng hoặc chấm dứt dịch vụ khi vi phạm điều khoản...

(Thêm nội dung chi tiết khác theo yêu cầu)
          ''',
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ),
    );
  }
}
