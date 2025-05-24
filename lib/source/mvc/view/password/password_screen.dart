import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:Y99/source/mvc/controller/password_controller.dart';
import 'password_footer.dart';
import 'password_form.dart';
import 'password_header.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({Key? key}) : super(key: key);
  final controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PasswordHeader(),
                          const SizedBox(height: 30),
                          const PasswordForm(),
                          const SizedBox(height: 20),
                          Center(child: Text("Tạo mã PIN",style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold),)),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PinCodeTextField(
                                  appContext: context,
                                  length: 6,
                                  controller: controller.pinCodeController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor: Colors.white,
                                    inactiveFillColor: Colors.white,
                                    selectedFillColor: Colors.white,
                                    activeColor: Colors.blue,
                                    selectedColor: Colors.blue,
                                    inactiveColor: Colors.grey,
                                    borderWidth: 2,
                                  ),
                                  animationDuration:
                                  const Duration(milliseconds: 300),
                                  enableActiveFill: true,
                                  onChanged: (value) {
                                    if (value.length == 6) {
                                      controller.pinError.value = '';
                                    }
                                  },
                                  onCompleted: (value) {
                                    controller.pinError.value = '';
                                  },
                                ),
                                if (controller.pinError.value.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      controller.pinError.value,
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                              ],
                            )),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              PasswordFooter(
                 controller.submitPassword,
              ),
            ],
          );
        },
      ),
    );
  }
}
