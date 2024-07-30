import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comments_app/utils/colors.dart';
import 'package:comments_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../view/login_screen.dart';

class AuthController extends GetxController {
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;
  RxBool obscurePassword = true.obs;

  void signIn(context, emailTextController, passwordController) async {
    isLoading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailTextController.text.trim(), password: passwordController.text.trim())
          .then((value) async {
        isLoading(false);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      Fluttertoast.showToast(
          msg: "Error Occurred",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red.shade200,
          textColor: black,
          fontSize: 14.sp);
    }
  }

  void signUp(context, nameController, emailTextController, passwordController) async {
    isLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(), password: passwordController.text.trim());
      String userName = nameController.text.trim();
      String email = emailTextController.text.trim();
      final userData = {
        "Name": userName,
        "Email": email,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userData)
          .then((value) async {
        Fluttertoast.showToast(
            msg: "User Registered Successfully",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: primaryColor,
            textColor: white,
            fontSize: 14.sp);
        isLoading(false);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      Fluttertoast.showToast(
          msg: "Error Occurred",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red.shade200,
          textColor: black,
          fontSize: 14.sp);
    }
  }
}
