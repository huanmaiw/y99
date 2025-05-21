import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/source/mvc/view/home/loan_screen.dart';
import 'package:Y99/source/mvc/view/home/new_screen.dart';
import 'package:Y99/source/mvc/view/home/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'loan_quick_screen.dart';
import 'main_home_screen.dart';

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
    Colors.red,
  ];
  final List<Widget> _screens = [
    MainHomeScreen(),
    LoanScreen(),
    NewScreen(),
   // LoanQuickScreen(),
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
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
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
                icon: Icons.home,
                //text: 'Trang chủ',
              ),
              GButton(
                icon: Icons.account_balance_wallet,
                //text: 'Khoản vay',
              ),
              GButton(
                icon: Icons.newspaper,
                //text: 'Tin tức',
              ),
              // GButton(
              //   icon: Icons.wallet,
              //   //text: 'Tài khoản',
              // ),
              GButton(
                icon: Icons.person,
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
