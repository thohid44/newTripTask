import 'package:bus/Email_Verify/view/email_verification.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/Widget/customTextForm.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/Widget/trip_ship_task_bar.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/views/get_A_Ride.dart';
import 'package:bus/pages/TripPages/views/give_A_Ride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bus/Utils/colors.dart';

class TripPage extends StatefulWidget {
  TripPage({super.key});

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  final TextEditingController search = TextEditingController();

  bool btn1Status = true;
  bool btn2Status = false;
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
                    btn1Status = true;
                    btn2Status = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color:
                          btn1Status == true ? Color(0xff4CA4C7) : Colors.grey,
                      //E6E7E8
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Give a Ride",
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
                    btn1Status = false;
                    btn2Status = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color:
                          btn2Status == true ? Color(0xff4CA4C7) : Colors.grey,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Get a Ride",
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
                          "Trip Posts", Colors.black, FontWeight.w700, 13.sp)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(height: 550.h, child: widgetList[index])
        ],
      ),
    );
  }

  int index = 0;

  List<Widget> widgetList = [GiveARide(), GetARide(), TripTaskPost()];
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
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 0.0.r)),
      ),
    );
  }
}

class TripTaskPost extends StatelessWidget {
  var controller = Get.put(TripController());
  final _formOfferkey = GlobalKey<FormState>();
  final TextEditingController shortmessage = TextEditingController();
  var amount = '';
  var seatValue;
  bool seatStatus = false;
  var seat;
  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> seatMember = [
      const DropdownMenuItem(child: Text("1"), value: "1"),
      const DropdownMenuItem(child: Text("2"), value: "2"),
      const DropdownMenuItem(child: Text("3"), value: "3"),
    ];
    return seatMember;
  }

  @override
  Widget build(BuildContext context) {
    controller.getMyTrips();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: controller.getMyTrips(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data.data.completedTrips.length,
                    itemBuilder: (context, index) {
                      var tripData = snapshot.data.data.completedTrips[index];
                      return Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 190.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: CustomText(
                                          "Start Point:${snapshot.data.data.completedTrips[index].startPoint}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Destination: ${tripData.destination}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Offers: ${tripData.postType}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Posted by:  ${tripData.via}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Male/25/Bachelor Degree or equivalent/Private job",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText(
                                          "Vehicle:  ${tripData.vehicleType}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: CustomText(
                                          "Amount \$${tripData.amount}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                    Container(
                                      child: CustomText("Details", Colors.black,
                                          FontWeight.normal, 13.sp),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: Text("Make Offers"),
                                                  content: Container(
                                                      height: 300.h,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Form(
                                                        key: _formOfferkey,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              child:
                                                                  CustomTextField(
                                                                onChange:
                                                                    (amount) {
                                                                  amount =
                                                                      amount;
                                                                },

//Put in the amount only if you want to negotiate
                                                                txt: "Amount",
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 35.h,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width:
                                                                          1.w,
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.r)),
                                                              child:
                                                                  DropdownButton(
                                                                  isExpanded: true,
                                                                underline:
                                                                    SizedBox(),
                                                                onTap: () {
                                                                  seatStatus =
                                                                      true;
                                                                },
                                                                hint: seatStatus ==
                                                                        false
                                                                    ? Text(
                                                                        "How Many of you")
                                                                    : Text(
                                                                        "${seat}"),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black),
                                                                value:
                                                                    seatValue,
                                                                onChanged: (t) {
                                                                  seat = t!;
                                                                  print(
                                                                      "passenger $seat");
                                                                },
                                                                items:
                                                                    dropdownItem,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Container(
                                                              child: TextField(
                                                                controller:
                                                                    shortmessage,
                                                                maxLines: 4,
                                                                decoration: InputDecoration(
                                                                    hintText:
                                                                        "short message (Optional)",
                                                                    border:
                                                                        OutlineInputBorder()),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            CustomButtonOne(
                                                                title: "Submit",
                                                                btnColor:
                                                                    navyBlueColor,
                                                                onTab: () {
                                                                  if (_formOfferkey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        "success");
                                                                  } else {
                                                                    Get.snackbar(
                                                                        "",
                                                                        "Offer not submitted");
                                                                  }
                                                                })
                                                          ],
                                                        ),
                                                      ))),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 10.w,
                                            top: 5.h,
                                            bottom: 5.h),
                                        decoration: BoxDecoration(
                                            color: navyBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: CustomText(
                                            "Make offer",
                                            Colors.white,
                                            FontWeight.normal,
                                            13.sp),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: CustomText(
                                          "Passenger:2  ${tripData.vehicleSeat}",
                                          Colors.black,
                                          FontWeight.normal,
                                          13.sp),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: navyBlueColor,
              ));
            }));
  }
}

AppBar customAppBar() {
  return AppBar(
    elevation: 0,
    title: const Text(
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
