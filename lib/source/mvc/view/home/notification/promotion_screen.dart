import 'package:flutter/material.dart';

class PromotionTab extends StatelessWidget {
  const PromotionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
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
            title: Text(
              "Khuyến mãi #${index + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Giảm 20% khi thanh toán hóa đơn.",
              style: TextStyle(fontSize: 13),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Xử lý khi nhấn vào khuyến mãi
            },
          ),
        );
      },
    );
  }
}
