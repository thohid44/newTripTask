import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyTripsOfferPage extends StatelessWidget {
  const MyTripsOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TripController());
    return Scaffold(
      body: FutureBuilder(
          future: controller.getMyTripsOffer(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var tripOfferData = snapshot.data.data[index];
                 
                    return Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 190.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: CustomText(
                                        "Start Point:${tripOfferData.tripStartPoint}",
                                        Colors.black,
                                        FontWeight.normal,
                                        13.sp),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: CustomText(
                                        "Amount {tripData.amount}",
                                        Colors.black,
                                        FontWeight.normal,
                                        13.sp),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(
                child: CircularProgressIndicator(
              color: navyBlueColor,
            ));
          }),
    );
  }
}
