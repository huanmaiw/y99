import 'package:Y99/core/app/color/res_color.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            // Banner
            SizedBox(
              height: 180,
              width: double.infinity,
              child: PageView(
                children: [
                  Image.asset(
                    'assets/banner/bn1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/banner/bn2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/banner/bn3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/banner/bn4.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/banner/bn5.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Dù bạn ở đâu thì chúng tôi vẫn luôn sẵn sàng",
                      style: TextStyle(
                          color: ResColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text("Với các gói vay linh hoạt, nhanh chóng và minh bạch, chúng tôi đồng hành cùng bạn chinh phục mọi mục tiêu cuộc sống",
                          style: TextStyle(
                            color: ResColor.black,
                            fontSize: 15,
                          ),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ResColor.blue,
                              // minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: (){}, child: Text("Vay nhanh với Y99",
                          style: TextStyle(color: Colors.white),)),
                        const SizedBox(width: 20),
                        // Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ResColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: ResColor.blue, width: 2),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Cầm đồ với Y99",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],

                ),
              ),
            ),
]

    );
  }
}
