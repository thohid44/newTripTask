import 'package:bus/pages/TripPages/views/my_trips_offer_page.dart';
import 'package:bus/profile/view/main_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../pages/Task/views/task_home_page.dart';


class UserDeshBoard extends StatefulWidget {
  const UserDeshBoard();
  @override
  State<UserDeshBoard> createState() => _UserDeshBoardState();
}

class _UserDeshBoardState extends State<UserDeshBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                margin: EdgeInsets.only(left: 20.w),
                width: 170.w,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const ExpansionTile(
                      title: Text("DeshBoard"),
                      children: [],
                    ),
                    ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: Text(
                        "Trip",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 15.sp),
                      ),
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40.w),
                          //   height: 40.h,
                          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),

                          child: Text(
                            "Post a Trip",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(MainProfilePage());
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40.w),
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                            //      height: 40.h,
                            child: Text(
                              "My Trips",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(MyTripsOfferPage()); 
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40.w),
                            //   height: 40.h,
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),

                            child: Text(
                              "My Trip offers",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40.w),
                          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                          //      height: 40.h,
                          child: Text(
                            "My Trip Ratings ",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
