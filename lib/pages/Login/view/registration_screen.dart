import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/pages/Login/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> genderList = [
      const DropdownMenuItem(child: Text("Gender"), value: "Gender"),
      const DropdownMenuItem(child: Text("Male"), value: "Male"),
      const DropdownMenuItem(child: Text("Female"), value: "Female"),
  
    ];
    return genderList;
  }

  String gender = "Gender"; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [
          Icon(Icons.filter),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 110.h,
            child: Image.asset("assets/logo.jpg"),
          ),
          SizedBox(
            height: 20.h,
          ),
          _textInputForm(
            controller: name,
            hint: "Full Name",
            userErrorText: "Full Name is Required",
          ),
          SizedBox(
            height: 10.h,
          ),
          _textInputForm(
            controller: phone,
            hint: "Phone Number",
            userErrorText: "Phone Number is Required",
          ),
          SizedBox(
            height: 10.h,
          ),
          _textInputForm(
            controller: email,
            hint: "Email",
            userErrorText: "Email is Required",
          ),
          SizedBox(height: 10.h,), 
          Container(
            height: 45.h, 
            padding: EdgeInsets.only(left: 10.w),
             margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              
              border: Border.all(width: 1.w, color: Colors.grey) , 
              borderRadius: BorderRadius.circular(10.r)

            ),

            child: DropdownButton(
              underline: SizedBox(),
              value: gender,
                 onChanged:(value){
                  setState(() {
                    gender = value.toString(); 
                  });
                 },
              items: dropdownItem,
          ),
          ), 
          
          SizedBox(
            height: 10.h,
          ),
          _textInputForm(
            controller: name,
            hint: "Password",
            userErrorText: "Password is Required",
          ),
          SizedBox(
            height: 10.h,
          ),
          _textInputForm(
            controller: name,
            hint: "Retype Password",
            userErrorText: "Retype Password is Required",
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButtonOne(
            title: "SignUp",
            btnColor: navyBlueColor,
            radius: 10.r,
            onTab: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            alignment: Alignment.center,
            child: Text(
              "By signing up, you agree to our Terms, Privacy, Data, Cookies,Acceptable Use and Copyright Policy",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: navyBlueColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Have an Account?",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: navyBlueColor),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    LoginScreen(),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: navyBlueColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

Widget _textInputForm({controller, hint, icon, inputAction, userErrorText}) {
  return Container(
    height: 45.h,
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.r))),
    child: TextFormField(
      textInputAction: inputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return userErrorText;
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          gapPadding: 4.6,
        ),
      ),
    ),
  );
}
