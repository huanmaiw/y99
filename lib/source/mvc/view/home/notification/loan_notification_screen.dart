import 'package:flutter/material.dart';

class LoanNotificationTab extends StatelessWidget {
  const LoanNotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/banner/km.png',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Ưu đãi miễn lãi suất 1 tháng",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Thanh toán khoản vay trước hạn để được ưu đãi.",
              style: TextStyle(fontSize: 13),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi người dùng nhấn vào thông báo
            },
          ),
        );
      },
    );
  }
}
