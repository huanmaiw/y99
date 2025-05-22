import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Align(
          alignment: Alignment.center,
            child: Text("Các khoản vay",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Loading...."),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
