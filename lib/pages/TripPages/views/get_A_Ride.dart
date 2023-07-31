import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class GetARide extends StatelessWidget {
  final TextEditingController search = TextEditingController();
  List<DropdownMenuItem<String>> get vehicleItem {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(
          child: Text("Select vehicle"), value: "Select vehicle"),
      const DropdownMenuItem(child: Text("Bus"), value: "Bus"),
    ];
    return destination;
  }

  String vehicle = "Select vehicle";
  var vehicled; 
  final TextEditingController startPoint = TextEditingController(); 
   final TextEditingController description = TextEditingController(); 
    final TextEditingController note = TextEditingController(); 


  List<DropdownMenuItem<String>> get howManyYou {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(
          child: Text("How many of you"), value: "How many of you"),
      const DropdownMenuItem(child: Text("1"), value: "1"),
       const DropdownMenuItem(child: Text("2"), value: "2"),
        const DropdownMenuItem(child: Text("3"), value: "3"),
    ];
    return destination;
  }

  String howMany = "How many of you";
  var howmay ;

  List<DropdownMenuItem<String>> get preferRide {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(
          child: Text("Prefer to get ride from"),
          value: "Prefer to get ride from"),
      const DropdownMenuItem(child: Text("1"), value: "1"),
    ];
    return destination;
  }

  String prefer = "Prefer to get ride from";
  var prefered;

  List<DropdownMenuItem<String>> get willingPay {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(child: Text("USD"), value: "USD"),
      const DropdownMenuItem(child: Text("BD"), value: "BD"),
    ];
    return destination;
  }

  String willing = "USD";
  var currency; 
  @override
  Widget build(BuildContext context) {
  var controller = Get.put(TripController());
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Container(
            width: 320.w,
            height: 35.h,
            child: CustomForm(
              hinttext: "Start Point",
              radius: 5.r,
              textController: startPoint,
            )),
        SizedBox(
          height: 5.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 150.w,
                  height: 35.h,
                  child: CustomForm(
                    hinttext: "Select Date",
                    radius: 5.r,
                    textController: search,
                  )),
              Container(
                  width: 150.w,
                  height: 35.h,
                  child: CustomForm(
                    hinttext: "Select Time",
                    radius: 5.r,
                    textController: search,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
            width: 320.w,
            height: 35.h,
            alignment: Alignment.center,
            child: CustomForm(
              hinttext: "Destination ",
              radius: 5.r,
              textController: description,
            )),
        SizedBox(
          height: 5.h,
        ),
        Container(
          color: Colors.grey,
          height: 150,
          width: 320.w,
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 155.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {
                    print(value); 
                    vehicled = value; 
                   
                  },
                  items: vehicleItem,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 155.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: howMany,
                  onChanged: (value) {
                    howmay = value; 
                     print(value); 
                  },
                  items: howManyYou,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: DropdownButton(
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    value: prefer,
                    onChanged: (value) {
                      prefered = value; 
                       print(value); 
                    },
                    items: preferRide,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Card(
                child: Container(
                  height: 35.h,
                  width: 90.w,
                  alignment: Alignment.center,
                  child: Text(
                    "willing to pay",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ),
              ),
              Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: DropdownButton(
                    underline: SizedBox(),
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    value: willing,
                    onChanged: (value) {
                      currency=value; 
                       print(value); 
                    },
                    items: willingPay,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextFormField(
            controller: note,
            decoration: InputDecoration(
              hintText: "Note",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        CustomButtonOne(
          title: "Sumbit",
          onTab: () {
          
              // print(startPoint.text.toString());
              //     print(description.text.toString());
              //         print(vehicled); 
           
               

             controller.getTripRide(startPoint.text.toString(), description.text.toString(),howmay, note.text.toString(),vehicled,prefered,currency,);
          },
          height: 40.h,
          width: 150.w,
          btnColor: navyBlueColor,
          radius: 10.r,
        )
      ],
    );
  }
}
