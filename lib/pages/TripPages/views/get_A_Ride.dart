import 'dart:async';

import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:geocoding/geocoding.dart';

class GetARide extends StatefulWidget {
  @override
  State<GetARide> createState() => _GetARideState();
}

class _GetARideState extends State<GetARide> {
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

  var startPointLat;
  var startPointLong;
  var destinationPointLong;
  var destinationPointLat;

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

  var howmay;

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

  final _startSearchFieldController = TextEditingController();
  final _endSearchFieldController = TextEditingController();

  DetailsResult? startPosition;
  DetailsResult? endPosition;

  late FocusNode startFocusNode;
  late FocusNode endFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;
  Future<void> GetAddressFromLatLong() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(22.379106, 91.917252);
    print(placemark);
  }

  @override
  void initState() {
    // TODO: implement initState
    GetAddressFromLatLong();
    super.initState();
    String apiKey = 'AIzaSyDLMJOClhhQjkfepu0R8iOCIt7bUpUF0nU';
    googlePlace = GooglePlace(apiKey);

    startFocusNode = FocusNode();
    endFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TripController());
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 300.w,
          height: 35.h,
          child: TextField(
            controller: _startSearchFieldController,
            autofocus: false,
            focusNode: startFocusNode,
            style: TextStyle(fontSize: 15.sp),
            decoration: InputDecoration(
                hintText: 'Starting Point',
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                suffixIcon: _startSearchFieldController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            predictions = [];
                            _startSearchFieldController.clear();
                          });
                        },
                        icon: Icon(Icons.clear_outlined),
                      )
                    : null),
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 1000), () {
                if (value.isNotEmpty) {
                  print("start point $value");
                  //places api
                  autoCompleteSearch(value);
                } else {
                  //clear out the results
                  setState(() {
                    predictions = [];
                    startPosition = null;
                  });
                }
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  dairyDatePicker(context);
                },
                child: Container(
                  width: 150.w,
                  height: 35.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 0.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5.w, color: Colors.grey)),
                  child: dateStatus == false
                      ? Text(
                          "${pickDate.day}-${pickDate.month}-${pickDate.year}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "${pickDate.day}-${pickDate.month}-${pickDate.year}"),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120.w,
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
          width: 300.w,
          height: 35.h,
          child: TextField(
            controller: _endSearchFieldController,
            autofocus: false,
            focusNode: endFocusNode,
            enabled: _startSearchFieldController.text.isNotEmpty &&
                startPosition != null,
            style: TextStyle(fontSize: 15.sp),
            decoration: InputDecoration(
                hintText: 'Destination Point',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 14.sp),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                suffixIcon: _endSearchFieldController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            predictions = [];
                            _endSearchFieldController.clear();
                          });
                        },
                        icon: Icon(Icons.clear_outlined),
                      )
                    : null),
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 1000), () {
                if (value.isNotEmpty) {
                  //places api
                  autoCompleteSearch(value);
                } else {
                  //clear out the results
                  setState(() {
                    predictions = [];
                    endPosition = null;
                  });
                }
              });
            },
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  predictions[index].description.toString(),
                ),
                onTap: () async {
                  final placeId = predictions[index].placeId!;

                  final details = await googlePlace.details.get(placeId);

                  if (details != null && details.result != null && mounted) {
                    if (startFocusNode.hasFocus) {
                      setState(() {
                        startPosition = details.result;
                        print(
                            "Start Point ${startPosition!.geometry!.location!.lat}");

                        _startSearchFieldController.text =
                            details.result!.name!;
                        predictions = [];
                      });
                    } else {
                      setState(() {
                        endPosition = details.result;
                        print(
                            "Start Point ${endPosition!.geometry!.location!.lat}");
                        _endSearchFieldController.text = details.result!.name!;
                        predictions = [];
                      });
                    }

                    if (startPosition != null && endPosition != null) {
                      print('navigate');
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MapScreen(),
                      //   ),
                      // );
                    }
                  }
                },
              );
            }),
        Container(
          color: Colors.grey,
          height: 120,
          width: 320.w,
        ),
        SizedBox(
          height: 2.h,
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
                  hint: vehicled,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {
                    print(value);
                    vehicled = value;
                    print("select ");
                  },
                  items: vehicleItem,
                ),
              ),
              SizedBox(
                width: 2.w,
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
          height: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Container(
                  alignment: Alignment.center,
                  height: 30.h,
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
                width: 2.w,
              ),
              Card(
                child: Container(
                  height: 30.h,
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
                  height: 30.h,
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
                      currency = value;
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
          height: 2.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextFormField(
            controller: note,
            decoration: InputDecoration(
              hintText: "Note",
              border: OutlineInputBorder(),
            ),
            maxLines: 1,
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

            startPointLat = startPosition!.geometry!.location!.lat;
            print("Start Lat $startPointLat");
            startPointLong = startPosition!.geometry!.location!.lng;
            print("Start Long $startPointLong");
            destinationPointLat = startPosition!.geometry!.location!.lat;
            print("Destination Lat $startPointLong");
            destinationPointLong = startPosition!.geometry!.location!.lng;
            print("Destination Long $startPointLong");

         
            controller.getTripRide(
              sPointLat: startPointLat, 
              sPointLng: startPointLong, 
              dPointLat: destinationPointLat,
              dPointLng: destinationPointLong,
              howmany: howmay, 
              note: note.text.toString(), 
              vehicled: vehicled, 
              prefered: prefered, 
              currency: currency



            );
          },
          height: 40.h,
          width: 150.w,
          btnColor: navyBlueColor,
          radius: 10.r,
        )
      ],
    );
  }

  String? selectedDates;

  DateTime pickDate = DateTime.now();

  var dateDairy;

  bool dateStatus = false;

  dairyDatePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: pickDate,
      firstDate: DateTime(2021),
      //  firstDate: DateTime.now(),
      // firstDate: DateTime(2022, 9, 15),

      // lastDate: DateTime(3000),

      lastDate: DateTime(2030, 01, 01),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        //   dateStatus = true;
        pickDate = userSelectedDate;
        print(pickDate);
        dateDairy = "${pickDate.year}-${pickDate.month}-${pickDate.day}";
        print("Date $selectedDates");
      });
    }
  }
}
