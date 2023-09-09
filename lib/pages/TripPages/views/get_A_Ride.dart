import 'dart:async';

import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/controller/vehicle_controller.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:date_format/date_format.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:geocoding/geocoding.dart';

class GetARide extends StatefulWidget {
  @override
  State<GetARide> createState() => _GetARideState();
}

class _GetARideState extends State<GetARide> {
  final TextEditingController search = TextEditingController();

  final List<String> vehicleitems = [
    'Car',
    'Bike',
    'Bus',
  ];

  final List<String> numberOfpassenger = [
    '1',
    '2',
    '3',
  ];
  final List<String> preferGetRide = [
    'Male',
    'Female',
    'Any',
  ];
  String? selectVehicle;
  String? selectPassenger;
  String? selectPrefer;

  var startPointLat;
  var startPointLong;
  var destinationPointLong;
  var destinationPointLat;
  var willPayAmount;

  final TextEditingController description = TextEditingController();

  final TextEditingController note = TextEditingController();

 

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
  List<Placemark>? placemark;
  GetAddressFromLatLong(lat, lng) async {
    placemark = await placemarkFromCoordinates(lat, lng);
  }

  @override
  void initState() {
    // TODO: implement initState

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
    var vehicleController  = Get.put(VehicleController());
    vehicleController.getMyVehicles();
  
    var controller = Get.put(TripController());
    return SingleChildScrollView(
      child: Column(
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
            height: 10.h,
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
            height: 10.h,
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

                          _startSearchFieldController.text =
                              details.result!.name!;
                          predictions = [];
                        });
                      } else {
                        setState(() {
                          endPosition = details.result;
                          print(
                              "Start Point ${endPosition!.geometry!.location!.lat}");
                          _endSearchFieldController.text =
                              details.result!.name!;
                          predictions = [];
                        });
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
                  width: 120.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Obx(() => vehicleController.isLoading ==true?DropdownButtonHideUnderline(
                    child: DropdownButton2<dynamic>(
                      isExpanded: true,
                      hint: Text(
                        'Select Vehicle',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: vehicleController.myVehicles
                          .map(( item) => DropdownMenuItem<String>(
                                value: item.type,
                                child: Text(
                                 "${ item.type}",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectVehicle,
                      onChanged: ( value) {
                        setState(() {
                          selectVehicle = value;
                          print(selectVehicle);
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 40,
                        width: 120,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ):CircularProgressIndicator()
                  )
                ),
                SizedBox(
                  width: 2.w,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'How many of you',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: numberOfpassenger
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectPassenger,
                      onChanged: (String? value) {
                        setState(() {
                          selectPassenger = value;
                          print(selectPassenger);
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 160,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
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
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Prefer to get ride from',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: preferGetRide
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectPrefer,
                        onChanged: (String? value) {
                          setState(() {
                            selectPrefer = value;
                            print(selectPrefer);
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.only(left: 3.w),
                          height: 40,
                          width: 150,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Card(
                  child: Container(
                   
                      height: 35.h,
                      width: 90.w,
                      alignment: Alignment.center,
                      child: CustomForm(
                        hinttext: "Will Pay",
                        radius: 5.r,
                        textController: willPayAmount,
                      )),
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
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomButtonOne(
            title: "Sumbit",
            onTab: () {
              startPointLat = startPosition!.geometry!.location!.lat;
              print("Start Lat $startPointLat");
              startPointLong = startPosition!.geometry!.location!.lng;
              print("Start Long $startPointLong");
              destinationPointLat = startPosition!.geometry!.location!.lat;
              print("Destination Lat $startPointLong");
              destinationPointLong = startPosition!.geometry!.location!.lng;
              print("Destination Long $startPointLong");
              print(
                  "address is ${GetAddressFromLatLong(startPointLat, startPointLong)}");

              controller.getTripRide(
                date: dateDairy.toString(),
                time: '10:00',
                duration: "2hr",
                sPointLat: startPointLat,
                sPointLng: startPointLong,
                dPointLat: destinationPointLat,
                dPointLng: destinationPointLong,
                howmany: selectPassenger,
                note: note.text.toString(),
                vehicled: selectVehicle,
                passengerType: selectPrefer,
                currency: currency,
                country: "Bangladesh",
                distance: "10",
                des: note.text.toString(),
              );
            },
            height: 40.h,
            width: 150.w,
            btnColor: navyBlueColor,
            radius: 10.r,
          )
        ],
      ),
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
