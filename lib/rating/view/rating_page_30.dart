import 'package:bus/Utils/colors.dart';
import 'package:bus/rating/view/star_rating_32.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class RatingPage30 extends StatelessWidget {
  const RatingPage30({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.h,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 530.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: double.infinity.w,
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 20.h,
                        ),
                        height: 130.h,
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: lightNavyColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: lightNavyColor.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundImage: AssetImage("assets/man.jpg"),
                              ),
                            ),
                            SizedBox(
                              width: 15.h,
                            ),
                            Container(
                              width: 200.w,
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "Did the service receiver wear a mask & maintain safe distance?",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Text('Yes'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        height: 30.w,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Text('No'),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(StarRating32(), ); 
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: navyBlueColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
                  child: Text(
                    "Next",
                    style: TextStyle(color: white, fontSize: 14.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
