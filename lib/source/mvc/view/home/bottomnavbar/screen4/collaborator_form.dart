import 'package:flutter/material.dart';

class CollaboratorFormScreen extends StatefulWidget {
  const CollaboratorFormScreen({super.key});

  @override
  State<CollaboratorFormScreen> createState() => _CollaboratorFormScreenState();
}

class _CollaboratorFormScreenState extends State<CollaboratorFormScreen> {
  bool agreePolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text("Đăng ký cộng tác viên",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 4,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  buildInputField("Họ và tên *", width: getFieldWidth(context)),
                  buildInputField("Số điện thoại *", width: getFieldWidth(context)),
                  buildInputField("Email *", width: getFieldWidth(context)),
                ],
              ),
              const SizedBox(height: 16),
              buildInputField("Địa chỉ chi tiết *"),
              const SizedBox(height: 16),
              buildInputField("Kênh bạn sẽ sử dụng để giới thiệu khách (Facebook, Zalo,...) *"),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: agreePolicy,
                    onChanged: (value) => setState(() => agreePolicy = value ?? false),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Tôi đã đọc và đồng ý với ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'chính sách bảo mật thông tin',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const TextSpan(text: ' và ', style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: 'điều khoản thi hành',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const TextSpan(
                            text: ' từ Y99 xác nhận đồng ý đăng ký vay.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: agreePolicy ? () {} : null,
                  icon: const Icon(Icons.send),
                  label: const Text("Gửi thông tin"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getFieldWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 800 ? (screenWidth - 64) / 3 - 12 : screenWidth;
  }

  Widget buildInputField(String label, {double? width}) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Nhập thông tin",
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: const Color(0xFFF1F4F8),
            ),
          ),
        ],
      ),
    );
  }
}
