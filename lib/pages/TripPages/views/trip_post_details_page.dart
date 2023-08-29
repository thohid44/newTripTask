import 'dart:convert';

import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/model/trip_post_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class tripPostDetailsPage extends StatefulWidget {
  String path;
  tripPostDetailsPage(this.path);

  @override
  State<tripPostDetailsPage> createState() => _tripPostDetailsPageState();
}

class _tripPostDetailsPageState extends State<tripPostDetailsPage> {
  final _box = GetStorage();

  TripPostDetailsModel? tripPostDetailsModel;
  var controller = Get.put(TripController());
  final _formOfferkey = GlobalKey<FormState>();
  final TextEditingController shortmessage = TextEditingController();
  final TextEditingController amount = TextEditingController();

  var tripId;
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

  getTripPostDetails() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      var response = await http.get(
        Uri.parse("${urlWithOutslash}${widget.path}"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print("detail ${jsonData}");
        tripPostDetailsModel = TripPostDetailsModel.fromJson(jsonData);
        return TripPostDetailsModel.fromJson(jsonData);
      }
    } catch (e) {
      print("Error $e");
    }
  }

  void initState() {
    getTripPostDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("path ${widget.path}");
    // controller.getTripPostDetails(widget.path);
    // //  print("toh detail ${controller.tripPostDetailsModel!.data!.title}");
    // var details = controller.tripPostDetailsModel!.data!;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getTripPostDetails(),
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            var details = tripPostDetailsModel!.data!;
            print("dtails $details");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60.w,
                      margin: EdgeInsets.all(9),
                      child: CustomText(
                          "Title:", Colors.black, FontWeight.bold, 15.sp),
                    ),
                    Container(
                      width: 260.w,
                      child: CustomText(tripPostDetailsModel!.data!.title,
                          Colors.black, FontWeight.bold, 15.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 60.w,
                      margin: EdgeInsets.all(9),
                      child: CustomText(
                          "Start Point:", Colors.black, FontWeight.bold, 15.sp),
                    ),
                    Container(
                      width: 260.w,
                      child: CustomText(" ${details.startPoint}", Colors.black,
                          FontWeight.bold, 15.sp),
                    ),
                  ],
                ),
              //   TripDetailsWidget(
              //       title: "Destination", value: details.destination),
              //   TripDetailsWidget(
              //       title: "Passenger",
              //       value: details.bids![0].passenger.toString()),
              //   TripDetailsWidget(title: "Pay", value: details.pay),
              //   TripDetailsWidget(
              //       title: "Bid Amount",
              //       value: details.bids![0].amount.toString()),
              //   TripDetailsWidget(
              //       title: "Agree", value: details.bids![0].agree.toString())
       ],
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: Text("Make Offers"),
                  content: Container(
                      height: 270.h,
                      decoration: BoxDecoration(),
                      child: Form(
                        key: _formOfferkey,
                        child: Column(
                          children: [
                            Container(
                                child: TextFormField(
                              controller: amount,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.w, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                onTap: () {
                                  setState(() {
                                    seatStatus = true;
                                  });
                                },
                                hint: seatStatus == false
                                    ? Text("How Many of you")
                                    : Text("${seat}"),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                value: seatValue,
                                onChanged: (t) {
                                  seat = t!;

                                  print("passenger $seat");
                                },
                                items: dropdownItem,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              child: TextField(
                                controller: shortmessage,
                                maxLines: 3,
                                decoration: InputDecoration(
                                    hintText: "short message (Optional)",
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButtonOne(
                                height: 40,
                                title: "Submit",
                                btnColor: navyBlueColor,
                                onTab: () {
                                  print(amount.text.toString());
                                  print(seat);
                                  print(shortmessage.text.toString());
                                  var id = tripPostDetailsModel!.data!.id;
                                  var _isValid =
                                      _formOfferkey.currentState!.validate();
                                  if (_isValid) {
                                    controller.bidOnTrip(amount.text.toString(),
                                        id, seat, shortmessage.text.toString());
                                  } else {
                                    Get.snackbar("", "Offer not submitted");
                                  }
                                })
                          ],
                        ),
                      ))),
            );
          },
          label: Text("Sent Offer")),
    );
  }
}

class TripDetailsWidget extends StatelessWidget {
  String? title;
  String? value;
  TripDetailsWidget({super.key, this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60.w,
          margin: EdgeInsets.all(9),
          child: CustomText("$title :", Colors.black, FontWeight.bold, 15.sp),
        ),
        Container(
          width: 260.w,
          child: CustomText(" ${value}", Colors.black, FontWeight.w500, 15.sp),
        ),
      ],
    );
  }
}
