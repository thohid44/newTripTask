import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/customTextForm.dart';
import 'package:bus/Widget/space_widgeter.dart';
import 'package:bus/pages/Login/controller/LoginController.dart';
import 'package:bus/pages/Login/view/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var con = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          elevation: 0,
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
        body: ListView(
          children: [
            SpaceWidget(
              hight: 60.h,
            ),
            Column(
              children: [
                Card(
                  elevation: 7,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 15.0, //extend the shadow
                          // offset: Offset(
                          //   5.0, // Move to right 5  horizontally
                          //   5.0, // Move to bottom 5 Vertically
                          // ),
                        )
                      ],
                    ),
                    child: Image.asset(
                      "assets/logo.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SpaceWidget(
              hight: 30.h,
            ),
            CustomTextForm(textController: _email, hinttext: "Enter Email"),
            SpaceWidget(
              hight: 20.h,
            ),
            CustomTextForm(
                textController: _password, hinttext: "Enter Password"),
            SpaceWidget(
              hight: 30.h,
            ),
         
    
            CustomButtonOne(
                title: "Login",
                btnColor: navyBlueColor,
                marginLR: 80.w,
                radius: 20.sp,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                onTab: () {
                  print("press login");
                  con.login(_email.text.toString(), _password.text.toString());
                }),
            SpaceWidget(
              hight: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: skyColor,
                ),
              ),
            ),
            SpaceWidget(
              hight: 5.h,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "--------------------------",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: skyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: skyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "--------------------------",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: skyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SpaceWidget(
              hight: 5.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: FaIcon(FontAwesomeIcons.google, size: 20.h)),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    child: Text(
                      "Login with Google",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: skyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SpaceWidget(
              hight: 5.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: FaIcon(FontAwesomeIcons.facebook, size: 20.h)),
                  SizedBox(
                    width: 7.h,
                  ),
                  Container(
                    child: Text(
                      "Login with Facebook",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: skyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Don't Have an Account ?",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: skyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(RegistrationScreen());
                    },
                    child: Container(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: skyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() {
    print(_email);
  }
}
