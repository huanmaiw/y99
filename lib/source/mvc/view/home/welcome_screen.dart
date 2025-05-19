import 'package:flutter/material.dart';
import 'package:y99/source/mvc/view/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                Image.asset(
                  'assets/banner/bn1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner/bn2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner/bn3.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner/bn4.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Image.asset(
                  'assets/banner/bn5.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          // Image.asset(
          //   'assets/banner/wl.png',
          //   fit: BoxFit.cover,
          //   height: MediaQuery.of(context).size.height * 0.5,
          //   width: double.infinity,
          // ),

          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Đăng ký thành công",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Bạn đã đăng ký tài khoản thành công, vui lòng đăng nhập lại để sử dụng!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
