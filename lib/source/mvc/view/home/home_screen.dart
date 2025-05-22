import 'package:Y99/source/mvc/view/home/bottomnavbar/screen3/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'bottomnavbar/screen2/loan_screen.dart';
import 'bottomnavbar/screen1/main_home_screen.dart';
import 'bottomnavbar/screen4/profile_screen.dart';
import 'notification/notification_screen.dart';

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
    Colors.green,
    Colors.purple,
  ];
  final List<Widget> _screens = [
    MainHomeScreen(),
    LoanScreen(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/logo/logo2.png',
            height: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(FontAwesomeIcons.bell, color: Colors.black),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
                Get.to(() => const NotificationScreen());
            },
          ),
        ],
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
                icon: FontAwesomeIcons.handshake,
                //text: 'Tin tức',
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                //text: 'Tài khoản',
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
