import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forget_password_controller.dart';
import 'forget_password_footer.dart';
import 'forget_password_form.dart';
import 'forget_password_header.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ForgetPasswordHeader(),
          SizedBox(height: 30),
          ForgetPasswordForm(),
          Spacer(),
          ForgetPasswordFooter(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
