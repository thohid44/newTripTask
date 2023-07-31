import 'package:bus/Email_Verify/view/email_pin_option_screen.dart';
import 'package:bus/Email_Verify/view/scan_nid_page.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/Login/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  List<DropdownMenuItem<String>> get dropdownItemday {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Education"), value: "Education"),
      const DropdownMenuItem(child: Text("Diploma"), value: "Diploma"),
      const DropdownMenuItem(child: Text("HSC"), value: "HSC"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemMonth {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Month"), value: "Month"),
      const DropdownMenuItem(child: Text("January"), value: "January"),
      const DropdownMenuItem(child: Text("Saturday"), value: "Saturday"),
      const DropdownMenuItem(child: Text("Sunday"), value: "Sunday"),
      const DropdownMenuItem(child: Text("Monday"), value: "Monday"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemYear {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Year"), value: "Year"),
      const DropdownMenuItem(child: Text("Friday"), value: "Friday"),
      const DropdownMenuItem(child: Text("Saturday"), value: "Saturday"),
      const DropdownMenuItem(child: Text("Sunday"), value: "Sunday"),
      const DropdownMenuItem(child: Text("Monday"), value: "Monday"),
    ];
    return menuItems;
  }

  String day = "Education";
  String month = "Month";
  String year = "Year";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "E-mail Verification",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(ProfilePhoto());
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/logo.jpg",
                      height: 100.h,
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText("Why do I need to provide the following information?",
                  Colors.grey, FontWeight.bold, 13.sp),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(ProfilePhoto());
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: cameraColor,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Icon(
                    Icons.camera_enhance,
                    size: 40.h,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: offWhite,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "Govt Id/NID/Passport/DL",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            )),
                        InkWell( 
                          onTap: () {
                            Get.to(ScanNIDPage()); 
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: offWhite,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "Front Photo",
                              style:
                                  TextStyle(fontSize: 12.sp, color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: offWhite,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text(
                            "Front Photo",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    // 2nd section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: offWhite,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "Profession",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.black),
                            )),
                        Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: offWhite,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 20.h,
                              ),
                              Text(
                                "ID front \n(Optional)",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: offWhite,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 20.h,
                              ),
                              Text(
                                "ID Back \n(Optional)",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    formWidget("Decription"),
                    formWidget("Company Name"),
                    customEducation(),
                    securityQuestion(),
                    securityAnswer(),
                    Row(
                      children: [
                        customDropDown(),
                        customDropDownMonth(),
                        customDropDownYear(),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButtonOne(
                        marginLR: 80.w,
                        width: 100.w,
                        btnColor: navyBlueColor,
                        radius: 15.r,
                        height: 35.h,
                        title: "NEXT",
                        onTab: () {
                          Get.to(EmailOtpScreen());
                        }),

                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget customEducation() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(Icons.arrow_drop_down_rounded),
              value: day,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                day = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemday)),
    );
  }

  Widget securityQuestion() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: day,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                day = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemday)),
    );
  }

  Widget securityAnswer() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: day,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                day = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemday)),
    );
  }

  Widget customDropDown() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 90.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: day,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                day = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemday)),
    );
  }

  Widget customDropDownMonth() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 90.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: month,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                month = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemMonth)),
    );
  }

  Widget customDropDownYear() {
    return Card(
      child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 90.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: year,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                year = newValue!;
                setState(() {
                  if (day.isNotEmpty) {}
                });
              },
              items: dropdownItemYear)),
    );
  }

  Widget formWidget(String hintText) {
    return Card(
      child: Container(
          height: 40.h,
          decoration: BoxDecoration(color: primaryColor),
          child: Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: hintText,
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )),
    );
  }
}
