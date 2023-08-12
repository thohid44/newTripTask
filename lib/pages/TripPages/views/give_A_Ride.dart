import 'dart:async';
import 'dart:convert';

import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/Widget/customButtonOne.dart';
import 'package:bus/Widget/custom_text_field.dart';
import 'package:bus/pages/Ship/views/shipPage.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/model/trips_search_model.dart';
import 'package:bus/pages/TripPages/views/please_search.dart';
import 'package:bus/pages/TripPages/views/trip_search_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GiveARide extends StatefulWidget {
  @override
  State<GiveARide> createState() => _GiveARideState();
}

class _GiveARideState extends State<GiveARide> {
  final TextEditingController search = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItem {
    List<DropdownMenuItem<String>> startPoint = [
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("feet"), value: "feet"),
    ];
    return startPoint;
  }

  String startPoint = "km";

  List<DropdownMenuItem<String>> get dropdownItem2 {
    List<DropdownMenuItem<String>> desRedious = [
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("feet"), value: "feet"),
    ];
    return desRedious;
  }

  List<DropdownMenuItem<String>> get selectVehicle {
    List<DropdownMenuItem<String>> destination = [
      const DropdownMenuItem(child: Text("select"), value: "select"),
      const DropdownMenuItem(child: Text("Bus"), value: "Bus"),
    ];
    return destination;
  }

  String vehicle = "select";
  bool searchStatus = false;
  var startkm = '';

  var deskm = '';

  var startRadius = '';

  var desRadius = '';

  var startPoints = '';

  var destionaPoint = '';

  var tripContrller = Get.put(TripController());

  final _box = GetStorage();

  tripSearch() async {
    var token = _box.read(LocalStoreKey.token);
    print("search token $token");
    //"${baseUrl}trip-search?slat=23.752308&slng=23.752308&dlat=23.7382053&dlng=23.7382053&sradious&dradious&unit=km&post_type=offer"
    try {
      var response = await http.get(
        Uri.parse(
            "${baseUrl}trip-search?slat=23.752308&slng=23.752308&dlat=23.7382053&dlng=23.7382053&sradious&dradious&unit=km&post_type=offer"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      print(response);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);

        return TripSearchModel.fromJson(jsonData);
      }
    } catch (e) {
      print("Error $e");
    }
  }

// Search Place
  final _startSearchFieldController = TextEditingController();
  final _endSearchFieldController = TextEditingController();

  DetailsResult? startPosition;
  DetailsResult? endPosition;

  late FocusNode startFocusNode;
  late FocusNode endFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

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
    return ListView(
      children: [
        SizedBox(
          height: 20.h,
        ),
        TextField(
          controller: _startSearchFieldController,
          autofocus: false,
          focusNode: startFocusNode,
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
              hintText: 'Starting Point',
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
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
        SizedBox(height: 10),
        TextField(
          controller: _endSearchFieldController,
          autofocus: false,
          focusNode: endFocusNode,
          enabled: _startSearchFieldController.text.isNotEmpty &&
              startPosition != null,
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
              hintText: 'End Point',
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
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
        SizedBox(
          height: 10.h,
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
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Container(
                  width: 135.w,
                  child: TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                            fullscreenDialog: true),
                      );
                      //    showPlaces(context: context);
                    },
                    autofocus: false,
                    showCursor: false,
                    decoration: InputDecoration(),
                  )),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 90.w,
                child: CustomTextField(
                    txt: "Radius",
                    label: "Radius",
                    hint: "Radius",
                    onChange: (t) {
                      startRadius = t;
                      print("Start Radius $startRadius");
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 70.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: startPoint,
                  onChanged: (t) {
                    startkm = t!;
                    print("Start Km $startkm");
                  },
                  items: dropdownItem,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Container(
                width: 135.w,
                child: CustomTextField(
                    txt: "Destination",
                    label: "Destination",
                    hint: "Enter your destination",
                    onChange: (t) {
                      destionaPoint = t;
                      print("Destination Radius $destionaPoint");
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 90.w,
                child: CustomTextField(
                    txt: "Radius",
                    label: "Radius",
                    hint: "Radius",
                    onChange: (t) {
                      desRadius = t;
                      print("Des Radius $desRadius");
                    }),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                alignment: Alignment.center,
                height: 35.h,
                width: 70.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: startPoint,
                  onChanged: (value) {
                    deskm = value!;
                    print("Des km $deskm");
                  },
                  items: dropdownItem,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {},
                  items: selectVehicle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  value: vehicle,
                  onChanged: (value) {},
                  items: selectVehicle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 35.h,
          width: 150.w,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: navyBlueColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 15.w,
              ),
              GestureDetector(
                onTap: () {
                  tripSearch();
                  setState(() {
                    searchStatus = true; 
                  });
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.w),
                    alignment: Alignment.center,
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButtonOne(
          title: "Clear Search",
          onTab: () {},
          height: 35.h,
          width: 150.w,
          btnColor: navyBlueColor,
          radius: 10.r,
        ),
        SizedBox(
          height: 10.h,
        ),
        searchStatus ==true? FutureBuilder(
            future: tripSearch(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                            margin: EdgeInsets.all(10.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Image.asset("assets/mobile.jpg"),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 100.h,
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Trips Search result",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Trips Search result",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Trips Search result",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    }),
              );
            })): Container()
      ],
    );
  }

  showPlaces({required context}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              //  shadowColor: yelloColor,
              // title: Text("Success"),
              contentPadding: EdgeInsets.all(8.0.h),
              actionsAlignment: MainAxisAlignment.center,
              content: Container(
                  alignment: Alignment.center,
                  height: 120.h,
                  padding: EdgeInsets.only(top: 10.h),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [],
                  )));
        });
  }
}
