import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/view/home/User/change_pass_pin/change_password_screen.dart';
import 'package:Y99/source/mvc/view/home/User/settings/settings_screen.dart';
import 'package:Y99/source/mvc/view/home/User/suport/support_screen.dart';
import 'package:Y99/source/mvc/view/home/User/terms/terms_and_service.dart';
import 'package:Y99/source/mvc/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget? _currentScreen; // Màn hiện tại

  void _showScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void _goBackToMain() {
    setState(() {
      _currentScreen = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.splash,
      body: _currentScreen ?? _buildMainProfile(),
    );
  }

  Widget _buildMainProfile() {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 20),
        _buildOptionTile(Icons.person, 'Thông tin người dùng', () {
          _showScreen(_buildUserInfo());
        }),
        _buildOptionTile(Icons.lock, 'Thay đổi mật khẩu', () {
          _showScreen(ChangePasswordScreen(onBack: _goBackToMain));
        }),
        _buildOptionTile(Icons.settings, 'Cài đặt', () {
          _showScreen( SettingScreen(onBack: _goBackToMain));
        }),
        _buildOptionTile(Icons.support_agent, 'Tư vấn hỗ trợ', () {
          _showScreen( SupportScreen(onBack: _goBackToMain));
        }),
        _buildOptionTile(Icons.assignment_outlined, 'Điều khoản và dịch vụ', () {
          _showScreen( TermsAndService(onBack: _goBackToMain));
        }),
        _buildOptionTile(Icons.info_outline, 'Giới thiệu về Y99', () {
          _showScreen( TermsAndService(onBack: _goBackToMain));
        }),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/logo/avt1.jpg'),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nguyễn Mai Huấn',
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Mã khách hàng: 99999', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => Get.to(() =>  LoginScreen()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Đăng xuất'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
       // _buildAppBar("Thông tin người dùng"),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildField("Họ và tên", "Nhập họ và tên"),
                _buildField("Số điện thoại", "Nhập số điện thoại"),
                _buildField("Giấy tờ vay/ Cầm cố", "Nhập CCCD/CMND"),
                _buildField("Ngày cấp", "dd/mm/yyyy"),
                _buildField("Nơi cấp", "Nơi cấp"),
                _buildField("Tỉnh/Thành phố", "Nhập tỉnh/thành phố"),
                _buildField("Quận/ Huyện", "Nhập quận/huyện"),
                _buildField("Địa chỉ chi tiết", "Số nhà, đường/ thôn, xóm"),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Lưu thông tin",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
              child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

