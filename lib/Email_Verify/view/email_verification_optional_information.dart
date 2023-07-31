import 'package:bus/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class EmailVerificationOptionalInfo extends StatefulWidget {
  const EmailVerificationOptionalInfo({super.key});

  @override
  State<EmailVerificationOptionalInfo> createState() =>
      _EmailVerificationOptionalInfoState();
}

class _EmailVerificationOptionalInfoState
    extends State<EmailVerificationOptionalInfo> {
  final TextEditingController area = TextEditingController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container( 
              child: Image.asset("assets/logo.jpg"),
            ),
          Container(
            child: Text("Optional Information", 
            style: TextStyle(fontSize: 15.sp, ),),
          ), 
          SizedBox(
            height: 20.h,
          ),
          customDropDown(),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.center,
            child: formWidget("Your residance area", area),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.center,
            child: formWidget("Emergency Contact person's name", area),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.center,
            child: formWidget("Emergency contact number", area),
          ),

            SizedBox(
            height: 20.h,
          ),
          Container(
            width: 300.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 35.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: navyBlueColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "<< Go Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    )),
                InkWell( 
                  onTap: (){
                    Get.to(EmailVerificationOptionalInfo()); 
                  },
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 15.w),
                      height: 35.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: navyBlueColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Text(
                        "NEXT >>",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget formWidget(String hintText, controller) {
    return Card(
      child: Container(
          width: 300.w,
          height: 45.h,
          decoration: BoxDecoration(color: primaryColor),
          child: Expanded(
            child: TextFormField(
              controller: area,
              decoration: InputDecoration(
                  hintText: hintText,
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItemday {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Blood Group"), value: "Blood Group"),
      const DropdownMenuItem(child: Text("A+"), value: "A+"),
      const DropdownMenuItem(child: Text("B+"), value: "B+"),
    ];
    return menuItems;
  }

  String gender = "Blood Group"; 
  Widget customDropDown() {
    return Card(
      child: Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          width: 300.w,
          decoration: BoxDecoration(color: primaryColor),
          child: DropdownButton(
              underline: SizedBox(),
              value: gender,
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
              onChanged: (String? newValue) {
                gender = newValue!;
                setState(() {
                  if (gender.isNotEmpty) {}
                });
              },
              items: dropdownItemday)),
    );
  }
}
