import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/views/trip_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GiveARide extends StatelessWidget {
  final TextEditingController search = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> startPoint = [
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("feet"), value: "feet"),
    ];
    return startPoint;
  }

  String startPoint = "km";

  List<DropdownMenuItem<String>> get dropdownItem2 {
    List<DropdownMenuItem<String>> desRedious = [
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("feet"), value: "feet"),
    ];
    return desRedious;
  }

  var destination = "";

  List<DropdownMenuItem<String>> get selectVehicle {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(child: Text("select"), value: "select"),
      const DropdownMenuItem(child: Text("Bus"), value: "Bus"),
    ];
    return destination;
  }

  String vehicle = "select";
  var startkm = '';
  var deskm = '';

  var startRadius = '';
  var desRadius = '';
  var startPoints = '';
  var tripContrller = Get.put(TripController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Container(
                width: 135.w,
                child: CustomTextField(
                    txt: "Start Point",
                    label: "Start Point",
                    hint: "Start Point",
                    onChange: (t) {
                      startPoints = t;
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 90.w,
                child: CustomTextField(
                    txt: "Radius",
                    label: "Radius",
                    hint: "Radius",
                    onChange: (t) {
                      startRadius = t;
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 70.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: startPoint,
                  onChanged: (t) {
                    startkm = t!;
                    print(startkm);
                  },
                  items: dropdownItem,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Container(
                width: 135.w,
                child: CustomTextField(
                    txt: "Destination",
                    label: "Destination",
                    hint: "Enter your destination",
                    onChange: (t) {
                      destination = t;
                      print(destination);
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 90.w,
                child: CustomTextField(
                    txt: "Radius",
                    label: "Radius",
                    hint: "Radius",
                    onChange: (t) {
                      startRadius = t;
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 70.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: startPoint,
                  onChanged: (value) {
                    deskm = value!;
                  },
                  items: dropdownItem,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {},
                  items: selectVehicle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {},
                  items: selectVehicle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 35.h,
          width: 150.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: navyBlueColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 15.w,
              ),
              GestureDetector(
                onTap: () {
                  tripContrller.tripSearch(
                    startPoints: startPoints,
                    startRadius: startRadius,
                    startkm: startkm,
                    destination: destination,
                    desRadius: desRadius,
                    deskm: deskm,
                    vehicle: vehicle,
                  );
                 
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButtonOne(
          title: "Clear Search",
          onTab: () {},
          height: 35.h,
          width: 150.w,
          btnColor: navyBlueColor,
          radius: 10.r,
        ),
         Obx(() =>  Expanded(
           child: ListView.builder(
          
                  itemCount: tripContrller.tripSearchList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                          margin: EdgeInsets.all(10.h),
                          child: Row(
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                child: Image.asset("assets/mobile.jpg"),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                height: 100.h,
                                child: Column(
                                  children: [
                                    Text(
                                      "Trips Search result",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Trips Search result",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Trips Search result",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  }),
         ),
          ),
      ],
    );
  }
}
