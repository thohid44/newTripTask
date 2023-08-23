

import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/customText.dart';

import 'package:bus/Widget/custom_text_field.dart';

import 'package:bus/pages/TripPages/Controller/TripController.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bus/Utils/colors.dart';
class TripTaskPost extends StatelessWidget {
  var controller = Get.put(TripController());
  final _formOfferkey = GlobalKey<FormState>();
  final TextEditingController shortmessage = TextEditingController();
  var amount = '';
  var tripId;
  var seatValue;
  bool seatStatus = false;
  var seat;
  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> seatMember = [
      const DropdownMenuItem(child: Text("1"), value: "1"),
      const DropdownMenuItem(child: Text("2"), value: "2"),
      const DropdownMenuItem(child: Text("3"), value: "3"),
    ];
    return seatMember;
  }

  @override
  Widget build(BuildContext context) {
    controller.getMyTrips();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: controller.getMyTrips(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data.data.postedTrips.length,
                    itemBuilder: (context, index) {
                      var tripData = snapshot.data.data.completedTrips[index];
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
                                          "Start Point:${snapshot.data.data.completedTrips[index].startPoint}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Destination: ${tripData.destination}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Offers: ${tripData.postType}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Posted by:  ${tripData.via}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Male/25/Bachelor Degree or equivalent/Private job",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Vehicle:  ${tripData.vehicleType}",
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
                                          "Amount \$${tripData.amount}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText("Details", Colors.black,
                                          FontWeight.normal, 13.sp),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: Text("Make Offers"),
                                                  content: Container(
                                                      height: 300.h,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Form(
                                                        key: _formOfferkey,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  CustomTextField(
                                                                onChange:
                                                                    (amount) {
                                                                  amount =
                                                                      amount;
                                                                },

//Put in the amount only if you want to negotiate
                                                                txt: "Amount",
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 35.h,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width:
                                                                          1.w,
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r)),
                                                              child:
                                                                  DropdownButton(
                                                                  isExpanded: true,
                                                                underline:
                                                                    SizedBox(),
                                                                onTap: () {
                                                                  seatStatus =
                                                                      true;
                                                                },
                                                                hint: seatStatus ==
                                                                        false
                                                                    ? Text(
                                                                        "How Many of you")
                                                                    : Text(
                                                                        "${seat}"),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black),
                                                                value:
                                                                    seatValue,
                                                                onChanged: (t) {
                                                                  seat = t!;
                                                                  print(
                                                                      "passenger $seat");
                                                                },
                                                                items:
                                                                    dropdownItem,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Container(
                                                              child: TextField(
                                                                controller:
                                                                    shortmessage,
                                                                maxLines: 4,
                                                                decoration: InputDecoration(
                                                                    hintText:
                                                                        "short message (Optional)",
                                                                    border:
                                                                        OutlineInputBorder()),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),

                                                            CustomButtonOne(
                                                                title: "Submit",
                                                                btnColor:
                                                                    navyBlueColor,
                                                                onTab: () {
                                                                  print(tripData.id.toString());
                                                                  print(amount);
                                                                    print(seat);
                                                                    print(shortmessage.text.toString());
                                                                  var _isValid = _formOfferkey
                                                                      .currentState!
                                                                      .validate();
                                                                  if (_isValid) {
                                                                controller.bidOnTrip(amount, tripData.id.toString(), seat, shortmessage.text.toString());
                                                                  } else {
                                                                    Get.snackbar(
                                                                        "",
                                                                        "Offer not submitted");
                                                                  }
                                                                })
                                                          ],
                                                        ),
                                                      ))),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 5.h,
                                            bottom: 5.h),
                                        decoration: BoxDecoration(
                                            color: navyBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: CustomText(
                                            "Make offer",
                                            Colors.white,
                                            FontWeight.normal,
                                            13.sp),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: CustomText(
                                          "Passenger:2  ${tripData.vehicleSeat}",
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
            }));
  }
}
