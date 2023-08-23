import 'dart:convert';

import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/Widget/customText.dart';
import 'package:bus/pages/TripPages/Controller/TripController.dart';
import 'package:bus/pages/TripPages/model/trip_post_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class tripPostDetailsPage extends StatefulWidget {
  String? path;
  tripPostDetailsPage(this.path);

  @override
  State<tripPostDetailsPage> createState() => _tripPostDetailsPageState();
}

class _tripPostDetailsPageState extends State<tripPostDetailsPage> {
  final _box = GetStorage();

  TripPostDetailsModel? tripPostDetailsModel;

  getTripPostDetails() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      var response = await http.get(
        Uri.parse("http://api.tripshiptask.com/api${widget.path}"),
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

  var controller = Get.put(TripController());
  @override
  Widget build(BuildContext context) {
    // controller.getTripPostDetails(widget.path);
    // //  print("toh detail ${controller.tripPostDetailsModel!.data!.title}");
    // var details = controller.tripPostDetailsModel!.data!;
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: getTripPostDetails(),
            builder: (context,AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
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
                            "Title:", Colors.black, FontWeight.bold, 15.sp),
                      ),
                      Container(
                        width: 260.w,
                        child: CustomText(" ${snapshot.data.data.title}",
                            Colors.black, FontWeight.bold, 15.sp),
                      ),
                    ],
                  )
                ],
              );
            }), 
            floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Sent Offer")),
            );
  }
}
