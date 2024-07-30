import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Text(
            'Comments',
            style: TextStyle(fontWeight: FontWeight.bold, color: white, fontSize: 16.sp),
          ),
          backgroundColor: primaryColor),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: secondaryBgColor,
                  radius: 25.r,
                  child: Text(
                    'A',
                    style: TextStyle(color: black, fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name: ',
                            style: TextStyle(
                                color: secondaryBgColor,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'skhgbkgbagkja',
                            style: TextStyle(
                                color: black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Email: ',
                            style: TextStyle(
                                color: secondaryBgColor,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'skhgbkgbagkja@mail.com',
                            style: TextStyle(
                                color: black, fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        ' sum lorewm ipsum lorewm ipsum lorewm ipsum lorewm ipsum  ',
                        style: TextStyle(
                          color: black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
