import 'package:bus/Utils/colors.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:flutter/gestures.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

  
  
  class MainProfilePage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
      return _MainProfilePageState();
    }
  
  }
  
  class _MainProfilePageState extends State<MainProfilePage> with TickerProviderStateMixin {
  
    late TabController _tabController;
  
    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 6, vsync: this);
      _tabController.animateTo(2);
    }
  
    static const List<Tab> _tabs = [
      const Tab( child: const Text('Tab One')),
      const Tab(text: 'Tab Two'),
      const Tab(text: 'Tab Three'),
    
    ];
    var controller = Get.put(TripController());
   
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: DefaultTabController(
          length: 6,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                // unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                // overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                //   if (states.contains(MaterialState.pressed)) {
                //     return Colors.blue;
                //   } if (states.contains(MaterialState.focused)) {
                //     return Colors.orange;
                //   } else if (states.contains(MaterialState.hovered)) {
                //     return Colors.pinkAccent;
                //   }
  
                //   return Colors.transparent;
                // }),
                // indicatorWeight: 10,
                // indicatorColor: Colors.red,
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicatorPadding: const EdgeInsets.all(5),
                // indicator: BoxDecoration(
                //   border: Border.all(color: Colors.red),
                //   borderRadius: BorderRadius.circular(10),
                //   color: Colors.pinkAccent,
                // ),
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                onTap: (int index) {
                  print('Tab $index is tapped');
                },
                enableFeedback: true,
                // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                // controller: _tabController,
                tabs: _tabs,
              ),
              title: const Text('TripShipTask'),
              backgroundColor: navyBlueColor,
            ),
            body:  TabBarView(
              physics: BouncingScrollPhysics(),
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          //     controller: _tabController,
              children: [
               FutureBuilder(
           future: controller.getMyTrips(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data.data.postedTrips.length,
                    itemBuilder: (context, index) {
                      var tripData = snapshot.data.data.postedTrips[index];
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
                                    Container(
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
              return const Center(child: CircularProgressIndicator(
                color: navyBlueColor,
              ));
            }),
     FutureBuilder(
           future: controller.getMyTrips(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data.data.seekedTrips.length,
                    itemBuilder: (context, index) {
                      var tripData = snapshot.data.data.seekedTrips[index];
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
                                    Container(
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
              return const Center(child: CircularProgressIndicator(
                color: navyBlueColor,
              ));
            }),
     FutureBuilder(
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
                                    Container(
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
              return const Center(child: CircularProgressIndicator(
                color: navyBlueColor,
              ));
            }),
    


              ],
            ),
          ),
        ),
      );
    }
  }