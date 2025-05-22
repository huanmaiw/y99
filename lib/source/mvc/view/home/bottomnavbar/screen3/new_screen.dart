import 'package:flutter/material.dart';

import 'collaborator_form.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
             Image.asset("assets/banner/ctv.png"),
            const SizedBox(height: 10),
            Text("Trở thành Cộng tác viên của Y99",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,5),
              child: Text(
                "Trong thế giới không ngừng thay đổi, chúng tôi luôn đổi mới để phục vụ bạn tốt hơn, "
                    "áp dụng công nghệ tiên tiến nhằm mang lại sự tiện lợi tối đa, giúp bạn tiếp cận tài chính mọi lúc, mọi nơi. "
                    "Bởi vì chúng tôi tin rằng, tài chính không chỉ là những con số mà còn là sự kết nối, là cơ hội, "
                    "là niềm tin mà chúng tôi muốn trao gửi đến bạn. Hãy để chúng tôi đồng hành cùng bạn trên chặng đường phía trước, "
                    "bởi dù bạn ở đâu, Y99 luôn sẵn sàng.",
                textAlign: TextAlign.justify,
              ),
        
            ),
        
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CollaboratorFormScreen(),
                    ),
                  );
                }, child: Text("Đăng ký ngay >",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
            const SizedBox(height: 10),
            Column(
              children: [
                Image.asset("assets/ctv/ctv1.png"),
                const SizedBox(height: 10),
                Image.asset("assets/ctv/ctv2.png"),
                const SizedBox(height: 10),
                Image.asset("assets/ctv/ctv3.png"),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
