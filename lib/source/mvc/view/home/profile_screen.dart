import 'package:Y99/source/mvc/view/home/User/change_password_screen.dart';
import 'package:Y99/source/mvc/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'User/settings_screen.dart';
import 'User/support_screen.dart';
import 'User/terms_and_service.dart';
import 'User/user_info_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // màu nền nhạt
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  NetworkImage(
                    'https://i.pravatar.cc/150?img=3', // ảnh đại diện mẫu
                  ),

                  //Image.asset("assets/logo/avt.jpg", fit: BoxFit.cover),
                //  AssetImage("assets/logo/avt.jpg"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Người dùng',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Mã khách hàng: 005166',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: ()=>Get.to(()=> LoginScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('Đăng xuất'),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
          _buildOptionTile(Icons.person, 'Thông tin người dùng',(){
            Navigator.push(context, MaterialPageRoute(
                builder: (_)=>const UserInfoScreen()));
          }),
          //_buildOptionTile(Icons.location_on, 'Địa chỉ'),
          _buildOptionTile(Icons.lock, 'Thay đổi mật khẩu',(){
            Navigator.push(context, MaterialPageRoute(
                builder: (_)=>const ChangePasswordScreen()));
          }),
          _buildOptionTile(Icons.settings, 'Cài đặt',(){
             Navigator.push(context, MaterialPageRoute(
               builder: (_)=>const SettingsScreen()));
          }),
          _buildOptionTile(Icons.support_agent, 'Tư vấn hỗ trợ',(){
             Navigator.push(context, MaterialPageRoute(
                 builder: (_)=>const SupportScreen()));
          }),
          _buildOptionTile(Icons.info, 'Điều khoản và dịch vụ',(){
             Navigator.push(context, MaterialPageRoute(
                 builder: (_)=>const TermsAndService()));
          }),
        ],
      ),
    );
  }

  // Widget _buildSwitchTile() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 16),
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     height: 60,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(14),
  //     ),
  //     child: Row(
  //       children: [
  //         const Icon(Icons.notifications, color: Colors.green),
  //         const SizedBox(width: 12),
  //         const Expanded(
  //             child: Text('Thông báo',
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
  //         Switch(
  //           value: true,
  //           onChanged: (value) {},
  //           activeColor: Colors.green,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildOptionTile(IconData icon, String title, VoidCallback opTap ) {
    return GestureDetector(
      onTap: opTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
