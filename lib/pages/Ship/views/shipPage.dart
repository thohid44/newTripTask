import 'package:bus/Email_Verify/view/email_verification.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/Widget/customTextForm.dart';
import 'package:bus/Widget/trip_ship_task_bar.dart';
import 'package:bus/pages/Ship/views/carry_a_package.dart';
import 'package:bus/pages/Ship/views/send_a_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ShipHomePage extends StatefulWidget {
  ShipHomePage({super.key});

  @override
  State<ShipHomePage> createState() => _ShipHomePageState();
}

class _ShipHomePageState extends State<ShipHomePage> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: ListView(
        children: [
          Container(
            height: 80.h,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: navyBlueColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                )),
            child: InkWell(
              onTap: () {
                Get.to(EmailVerification());
              },
              child: Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 70.w,
                      child: Icon(
                        Icons.person,
                        size: 60.h,
                        color: white,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110.w,
                        child: CustomText(
                            "Zakir Hossain", white, FontWeight.w500, 13.sp),
                      ),
                      Container(
                        width: 110.w,
                        child: CustomText(
                            "Acct: 123456", white, FontWeight.w500, 13.sp),
                      )
                    ],
                  ),
                  Container(
                      width: 160.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: lightNavyColor,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: navyBlueColor,
                            child:
                                CustomText("\$", white, FontWeight.bold, 13.sp),
                          ),
                          CustomText(
                            "Tab For Balance",
                            white,
                            FontWeight.w400,
                            13.sp,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TripShipTaskBar(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Color(0xff4CA4C7),
                      //E6E7E8
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Send a Package",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: Color(0xff4CA4C7),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Carry a Package",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextForm(
                hinttext: "Search",
                width: 150.w,
                height: 40.h,
                textController: search,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Container(
                  height: 40.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: Color(0xffDEDFE0),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      Icon(Icons.list_alt),
                      CustomText(
                          "Task Posts", Colors.black, FontWeight.w700, 13.sp)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(height: 600.h, child: widgetList[index])
        ],
      ),
    );
  }

  int index = 0;

  List<Widget> widgetList = [SendAPackage(), CarryAPackage(),  TripTaskPost()];
}

class CustomForm extends StatelessWidget {
  TextEditingController? textController;
  double? radius;
  String? hinttext;

  CustomForm({super.key, this.hinttext, this.radius, this.textController});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hinttext ?? "Enter Data",
        border: OutlineInputBorder(), 
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0.0.r)),
        
      ),
    );
  }
}

class TripTaskPost extends StatelessWidget {
  const TripTaskPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 190.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: CustomText("Start Point: Rajshahi",
                                Colors.black, FontWeight.w600, 13.sp),
                          ),
                          SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText("Destination: Bogura, Bangladesh",
                                Colors.black, FontWeight.w600, 13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText("Offers: 10-20", Colors.black,
                                FontWeight.w600, 13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText(
                                "Posted by: Admin Gov ID Verifide",
                                Colors.black,
                                FontWeight.w600,
                                13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText(
                                "Male/25/Bachelor Degree or equivalent/Private job",
                                Colors.black,
                                FontWeight.w600,
                                13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText("Vehicle: Car", Colors.black,
                                FontWeight.w600, 13.sp),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 10.h,), 
                    Container(
                      width: 120.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: CustomText("Amount \$ 2400", Colors.black,
                                FontWeight.w600, 13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            child: CustomText("Details", Colors.black,
                                FontWeight.w600, 13.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                            decoration: BoxDecoration(
                                color: navyBlueColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: CustomText("Make offer", Colors.white,
                                FontWeight.w600, 13.sp),
                          ),
                           SizedBox(height: 10.h,), 
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: CustomText("Passenger:2", Colors.black,
                                FontWeight.w600, 13.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

AppBar customAppBar() {
  return AppBar(
    elevation: 0,
    title: Text(
      "Trip Ship Task",
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        )),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter,
            color: Colors.black,
          )),
    ],
  );
}
