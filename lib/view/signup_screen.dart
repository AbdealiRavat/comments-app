import 'package:comments_app/utils/colors.dart';
import 'package:comments_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Text(
            'Comments',
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 24.sp),
          ),
          backgroundColor: bgColor),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            commonTextField(nameController, 'Name', false),
            commonTextField(emailTextController, 'Email', false),
            Obx(() => commonTextField(passwordController, 'Password', true)),
            Spacer(),
            buttonWidget(() {
              authController.signUp(
                  context, nameController, emailTextController, passwordController);
              // Navigator.pushAndRemoveUntil(context,
              //     MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
            }, 'Signup'),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    ' Login',
                    style: TextStyle(
                        fontSize: 14.sp, color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget commonTextField(TextEditingController controller, String hintText, bool isPassword) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? authController.obscurePassword.value : false,
        style: TextStyle(color: black, fontSize: 14.sp),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      authController.obscurePassword.value = !authController.obscurePassword.value;
                    },
                    child: Icon(
                        authController.obscurePassword.value
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                        size: 20))
                : const SizedBox(),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                gapPadding: 2,
                borderRadius: BorderRadius.circular(15.r)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                gapPadding: 2,
                borderRadius: BorderRadius.circular(15.r)),
            hintText: hintText,
            filled: true,
            fillColor: white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                gapPadding: 2,
                borderSide: BorderSide(
                  color: bgColor,
                  width: 2.w,
                )),
            hintStyle: TextStyle(color: black, fontSize: 14.sp)),
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
          style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
