import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/Task/views/task_home_page.dart';
import 'package:bus/pages/TripPages/views/trip_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../pages/Ship/views/shipPage.dart';

class TripShipTaskBar extends StatelessWidget {
  const TripShipTaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          height: 25.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: tealColor, borderRadius: BorderRadius.circular(5.r)),
          child: InkWell(
              onTap: () {
                Get.to(TripPage());
              },
              child: CustomText("Trip", Colors.white, FontWeight.w600, 15.sp)),
        ),
        Container(
          alignment: Alignment.center,
           height: 25.h,
         width: 90.w,
          decoration: BoxDecoration(
              color: tealColor, borderRadius: BorderRadius.circular(5.r)),
          child: InkWell(
              onTap: () {
                Get.to(ShipHomePage());
              },
              child: CustomText("Ship", Colors.white, FontWeight.w600, 15.sp)),
        ),
        Container(
          alignment: Alignment.center,
         height: 25.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: tealColor, borderRadius: BorderRadius.circular(5.r)),
          child: InkWell(
              onTap: () {
                Get.to(TaskHomePage());
              },
              child: CustomText("Task", Colors.white, FontWeight.w600, 15.sp)),
        )
      ],
    );
  }
}
