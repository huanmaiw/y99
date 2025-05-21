import 'package:Y99/core/app/color/res_color.dart';
import 'package:Y99/core/app/theme/app_key.dart';
import 'package:Y99/source/mvc/controller/register_controller.dart';
import 'package:Y99/source/mvc/view/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 30),
                  _buildFormFields(),
                ],
              ),
            ),
          ),
          _buildRegisterButton(),
          _buildLoginRedirect(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
        color: ResColor.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset("assets/logo/logo2.png", height: 50, width: 50),
          const SizedBox(height: 8),
          Text(AppKeys.slogan,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildTextField(controller.usernameController, "Họ và tên"),
          const SizedBox(height: 16),
          _buildTextField(controller.passwordController, "Mật khẩu"),
          //_buildTextField(controller.birthDateController, "Ngày sinh"),
          //_buildDatePickerField(),
          const SizedBox(height: 16),
          // _buildTextField(controller.phoneController, "Số điện thoại",
          //     prefix: const Padding(
          //       padding: EdgeInsets.only(top: 14),
          //       child: Text("   +84", style: TextStyle(fontWeight: FontWeight.bold)),
          //     )),
          _buildTextField(controller.emailController,"Email",
              prefix: const Icon(Icons.email_outlined)),
          const SizedBox(height: 16),
          // _buildTextField(controller.genderController, "Giới tính"),
         // _buildGenderDropdown(),

          RichText(
            text: TextSpan(
              text: 'Bằng cách đăng ký, bạn đồng ý với ',
              style: const TextStyle(color: Colors.black, fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                  text: 'Điều khoản của chúng tôi.',
                  style: const TextStyle(
                      color: ResColor.orange, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Widget _buildGenderDropdown() {
  //   return Obx(() => DropdownButtonFormField<String>(
  //     value: controller.selectedGender.value.isEmpty ? null : controller.selectedGender.value,
  //     decoration: InputDecoration(
  //       // labelText: "Giới tính",
  //      // labelStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600),
  //       hintText: "Chọn giới tính",
  //       hintStyle: TextStyle(color: Colors.grey[400]),
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: BorderSide(color: Colors.grey, width: 2),
  //       ),
  //       //suffixIcon: const Icon(Icons.keyboard_arrow_down),
  //     ),
  //     dropdownColor: Colors.white,
  //     iconSize: 24,
  //     elevation: 4,
  //     style: const TextStyle(color: Colors.black87, fontSize: 16),
  //     items: const [
  //       DropdownMenuItem(value: "Nam", child: Text("Nam")),
  //       DropdownMenuItem(value: "Nữ", child: Text("Nữ")),
  //     ],
  //     onChanged: (value) {
  //       if (value != null) {
  //         controller.selectedGender.value = value;
  //         controller.genderController.text = value;
  //       }
  //     },
  //   ));
  // }


  // Widget _buildDatePickerField() {
  //   return TextField(
  //     controller: controller.birthDateController,
  //     readOnly: true,
  //     onTap: () async {
  //       DateTime? pickedDate = await showDatePicker(
  //         context: Get.context!,
  //         initialDate: DateTime.now(),
  //         firstDate: DateTime(1900),
  //         lastDate: DateTime.now(),
  //         //locale: const Locale("vi", "VN"),
  //       );
  //       if (pickedDate != null) {
  //         controller.selectedBirthDate.value = pickedDate;
  //         controller.birthDateController.text =
  //         "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  //       }
  //     },
  //     decoration: InputDecoration(
  //       prefixIcon: const Icon(Icons.calendar_today),
  //       hintText: "Ngày sinh",
  //       hintStyle: const TextStyle(color: Colors.grey),
  //       border: OutlineInputBorder(
  //         borderSide: const BorderSide(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTextField(TextEditingController controller, String hintText,
      {Widget? prefix}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Obx(() => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ResColor.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: controller.isLoading.value
              ? null
              : () {
            controller.register(Get.context!);
          },

          child: controller.isLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
            "ĐĂNG KÝ",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ResColor.white),
          ),
        ),
      )),
    );
  }

  Widget _buildLoginRedirect(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: 'Tôi đã có tài khoản !',
            style: const TextStyle(color: Colors.black, fontSize: 14),
            children: <TextSpan>[
              TextSpan(
                text: ' Đăng nhập',
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() =>  LoginScreen());
                  },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
