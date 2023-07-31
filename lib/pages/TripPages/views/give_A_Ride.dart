import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("feet"), value: "feet"),
    ];
    return destination;
  }

  String destination = "km";

  List<DropdownMenuItem<String>> get selectVehicle {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(child: Text("select"), value: "select"),
      const DropdownMenuItem(child: Text("Bus"), value: "Bus"),
    ];
    return destination;
  }
  String vehicle = "select";
  
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
                onChange: (){
             
               }),
             ), 
              SizedBox(
                width: 10.w,
              ),
              Container(
                  width: 80.w,
                  height: 35.h,
                  child: CustomForm(
                    hinttext: "Radius",
                    radius: 5.r,
                    textController: search,
                  )),
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
                  onChanged: (value) {},
                  items: dropdownItem,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Container(
                  width: 150.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  child: CustomForm(
                    hinttext: "Destination ",
                    radius: 5.r,
                    textController: search,
                  )),
              SizedBox(
                width: 10.w,
              ),
              Container(
                  width: 80.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  child: CustomForm(
                    hinttext: "Radius",
                    radius: 5.r,
                    textController: search,
                  )),
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
                  onChanged: (value) {},
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
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp,
                    ),
                  )),
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
        )
      ],
    );
  }
}
