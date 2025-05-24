import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/view/home/bottomnavbar/screen3/promotion_screen.dart';
import 'package:Y99/source/mvc/view/home/bottomnavbar/screen4/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'bottomnavbar/screen2/loan_screen.dart';
import 'bottomnavbar/screen1/main_home_screen.dart';
import 'bottomnavbar/screen5/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _tabColors = [
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.purple,
  ];
  final List<Widget> _screens = [
    MainHomeScreen(),
    LoanScreen(),
    PromotionScreen(),
    NewScreen(),
    ProfileScreen(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.splash,
      appBar: AppBar(

        automaticallyImplyLeading: false,
        title:  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: Image.asset(
                "assets/logo/logo1.png",
                height: 40,
                width: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các phần tử trong Row
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                Text(
                  "Chào buổi sáng",
                  style: GoogleFonts.lato(fontSize: 20),
                ),
                const SizedBox(width: 8),
                Text(
                  "Kiệu Mai Huấn",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: ResColor.splash,
        elevation: 0,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: _tabColors[_selectedIndex].withOpacity(0.8),
            color: Colors.grey[600],
            tabs: const [

              GButton(
                icon: FontAwesomeIcons.house,
                //text: 'Trang chủ',
              ),
              GButton(
                icon: FontAwesomeIcons.handHoldingDollar ,
                //text: 'Khoản vay',
              ),
              GButton(
                icon: FontAwesomeIcons.ticket,
                 //text: 'Khuyến mãi',
              ),
              GButton(
                icon: FontAwesomeIcons.handshake,
                //text: 'Thông báo',
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                //text: 'Cá nhân',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onTabChange,
          ),
        ),
      ),
    );
  }
}
