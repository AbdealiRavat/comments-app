import 'dart:convert';

import 'package:comments_app/model/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../utils/colors.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CommentsModel> commentsList = <CommentsModel>[].obs;

  getData() async {
    String url = 'https://jsonplaceholder.typicode.com/comments';

    isLoading(true);
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        commentsList.value =
            jsonList.map((json) => CommentsModel.fromJson(json as Map<String, dynamic>)).toList();

        isLoading(false);
      } else {
        isLoading(false);
        Fluttertoast.showToast(
            msg: "Error Occurred",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.red.shade200,
            textColor: black,
            fontSize: 14.sp);
      }
    } catch (e, stack) {
      Fluttertoast.showToast(
          msg: "Error Occurred",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red.shade200,
          textColor: black,
          fontSize: 14.sp);
      isLoading(false);
    }
  }
}
