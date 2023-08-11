import 'dart:convert';

import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/model/trips_search_model.dart';
import 'package:bus/pages/TripPages/views/trip_search_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
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
  var destionaPoint = '';
  var tripContrller = Get.put(TripController());
  final _box = GetStorage();
  tripSearch() async {
    var token = _box.read(LocalStoreKey.token);
    print("search token $token");
    //"${baseUrl}trip-search?slat=23.752308&slng=23.752308&dlat=23.7382053&dlng=23.7382053&sradious&dradious&unit=km&post_type=offer"
    try {
      var response = await http.get(
        Uri.parse(
            "${baseUrl}trip-search?slat=23.752308&slng=23.752308&dlat=23.7382053&dlng=23.7382053&sradious&dradious&unit=km&post_type=offer"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        return TripSearchModel.fromJson(jsonData);
      }
    } catch (e) {
      print("Error $e");
    }
  }

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
                      print("Start Point $startPoints");
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
                       print("Start Radius $startRadius");
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
                  print("Start Km $startkm");
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
                      destionaPoint = t;
                      print("Destination Radius $destionaPoint");
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
                      desRadius = t;
                          print("Des Radius $desRadius");
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
                    print("Des km $deskm");
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
                  tripSearch();
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
        SizedBox(
          height: 10.h,
        ),
        FutureBuilder(
            future: tripSearch(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.data.length,
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
                                  child: const Column(
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
              );
            }))
      ],
    );
  }
}
