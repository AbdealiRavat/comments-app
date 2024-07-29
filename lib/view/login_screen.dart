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
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: const Color(0xff0c54be),
            fontSize: 24.sp),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            commonTextField(login.emailController.value, 'Email', Colors.black, true, false),
            commonTextField(login.passwordController.value, 'Password', Colors.black, true, true),
            Spacer(),
            buttonWidget(() {}, 'Login'),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New here?',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
                Text(
                  ' Signup',
                  style: TextStyle(fontSize: 14.sp, color: const Color(0xff0c54be)),
                ),
              ],
            ),
            SizedBox(height: 10.h),
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

Widget buttonWidget(void Function() onTap, String text) {
  return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 90.w, vertical: 12.h)),
        backgroundColor: MaterialStatePropertyAll(Color(0xff0c54be)),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold),
      ));
}
