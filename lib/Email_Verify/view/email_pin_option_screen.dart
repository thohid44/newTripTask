import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailOtpScreen extends StatefulWidget {
  const EmailOtpScreen({super.key});

  @override
  State<EmailOtpScreen> createState() => _EmailOtpScreenState();
}

class _EmailOtpScreenState extends State<EmailOtpScreen> {
  // List<DropdownMenuItem<String>> get dropdownItem {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     const DropdownMenuItem(child: Text("Select Year"), value: "Select Year"),
  //     const DropdownMenuItem(child: Text("2023"), value: "2023"),
  //     const DropdownMenuItem(child: Text("2024"), value: "2024"),
  //     const DropdownMenuItem(child: Text("2025"), value: "2025"),
  //     const DropdownMenuItem(child: Text("2026"), value: "2025"),
  //   ];
  //   return menuItems;
  // }

  String education = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 100.h,
              child: Image.asset("assets/logo.jpg"),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              child: Text(
                "Enter PIN",
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      inputFormatters: [],
                      decoration: InputDecoration(),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      inputFormatters: [],
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); 
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      inputFormatters: [],
                       onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); 
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      inputFormatters: [],
                       onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); 
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      inputFormatters: [],
                       onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); 
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    width: 35.w,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      inputFormatters: [],
                       onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus(); 
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonOne(
                    title: "CANCEL",
                    height: 40.h,
                    radius: 10.r,
                    fontWeight: FontWeight.normal,
                    marginLR: 0,
                    btnColor: navyBlueColor,
                    onTab: () {}),
                SizedBox(
                  width: 30.w,
                ),
                CustomButtonOne(
                    title: "SUBMIT",
                    height: 40.h,
                    fontWeight: FontWeight.normal,
                    radius: 10.r,
                    marginLR: 0,
                    btnColor: navyBlueColor,
                      onTab: () {
                          Get.to(ProfileScreen());
                        })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
