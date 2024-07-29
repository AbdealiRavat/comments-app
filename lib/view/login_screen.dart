import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController login = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Comments',
        style: TextStyle(color: Color(0xff0c54be)),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonTextField(login.nameController.value, 'Name', Colors.black, false, false),
            commonTextField(login.emailController.value, 'Email', Colors.black, false, false),
            commonTextField(login.passwordController.value, 'Password', Colors.black, false, false),
          ],
        ),
      ),
    );
  }
}

Widget commonTextField(TextEditingController controller, String hintText, Color tColor,
    bool isEnabled, bool isPassword) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    margin: EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      obscureText: isPassword ? true : false,
      enabled: isEnabled,
      style: TextStyle(color: tColor, fontSize: 16),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          // suffixIcon: isPassword
          //     ? InkWell(
          //     splashFactory: NoSplash.splashFactory,
          //     onTap: () {
          //       login.obscurePassword.value = !login.obscurePassword.value;
          //     },
          //     child: Icon(
          //         login.obscurePassword.value
          //             ? Icons.visibility_off_rounded
          //             : Icons.visibility,
          //         size: 20))
          //     : const SizedBox(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none, gapPadding: 2, borderRadius: BorderRadius.circular(15)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none, gapPadding: 2, borderRadius: BorderRadius.circular(15)),
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xfff5f5f5),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              gapPadding: 2,
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              )),
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
    ),
  );
}
