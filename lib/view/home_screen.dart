import 'package:comments_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.getData();
    super.initState();
  }

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
        body: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            itemBuilder: (context, index) {
              return homeController.isLoading.value
                  ? SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration:
                          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: secondaryBgColor,
                            radius: 25.r,
                            child: Text(
                              homeController.commentsList[index].name[0].capitalizeFirst.toString(),
                              style: TextStyle(
                                  color: black, fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Name: ',
                                        style: TextStyle(
                                            color: secondaryBgColor,
                                            fontSize: 12.sp,
                                            fontStyle: FontStyle.italic)),
                                    Expanded(
                                      child: Text(homeController.commentsList[index].name,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Text(
                                      'Email: ',
                                      style: TextStyle(
                                          color: secondaryBgColor,
                                          fontSize: 12.sp,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Expanded(
                                      child: Text(homeController.commentsList[index].email,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  homeController.commentsList[index].body,
                                  maxLines: 4,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
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
            itemCount: homeController.commentsList.length,
          ),
        ));
  }
}
