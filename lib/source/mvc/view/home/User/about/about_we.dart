import 'package:Y99/core/app/theme/text.dart';
import 'package:flutter/material.dart';

class AboutWe extends StatelessWidget {
  const AboutWe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Center(
              child: Text("Giới thiệu về Y99",style: ResTypography.styleText)),
          const SizedBox(height: 20),
          const Text(
            "Y99 là một nền tảng giải trí trực tuyến, nơi người dùng có thể tham gia vào các trò chơi, hoạt động và sự kiện thú vị. Chúng tôi cung cấp một môi trường an toàn và thân thiện cho tất cả mọi người.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            "Hãy để chúng tôi đồng hành cùng bạn trên chặng đường phía trước, bởi dù bạn ở đâu, Y99 luôn sẵn sàng",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          Text("Doanh Nghiệp Tư Nhân Cầm Đồ Y99",style: ResTypography.styleText,),
          const SizedBox(height: 10),
          Text("Địa chỉ: 99B, Nguyễn Trãi, Phường Cái Khế, Quận Ninh Kiều, Thành phố Cần Thơ,\nHotline: 18006368",
            style: ResTypography.styleText1,),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
