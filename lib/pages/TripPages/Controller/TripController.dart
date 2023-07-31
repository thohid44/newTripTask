import 'dart:convert';

import 'package:bus/Api_services/ApiService.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/pages/TripPages/model/my_trip_posts_model.dart';
import 'package:bus/pages/TripPages/model/my_trips_offer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class TripController extends GetxController{

final _box = GetStorage();
var isLoading = false.obs; 

  getTripRide(sPoint,des,note, prefered,howmany, currency,vehicled) async{
 var token = _box.read(LocalStoreKey.token); 
 print(token); 
 var mapData = {
    "post_type": "sit",
    "start_point": sPoint,
    "via": "est",
    "date": "2023-05-24",
    "time": "10:00",
    "destination": "porro",
    "distance": "nulla",
    "duration": "esse",
    "vehicle": vehicled,
    "vehicle_type": howmany,
    "pay": currency,
    "s_lat": "eaque",
    "s_lng": "assumenda",
    "d_lat": "doloribus",
    "d_lng": "et",
    "country": "dignissimos",
    "currency": currency,
    "preferred_passenger": "ullam",
    "vehicle_seat": howmany,
    "details": note
};

    try {
      isLoading(true);
      var response = await ApiService().postData(mapData,"trip");
    
     
      if (response.statusCode == 201) {
        print(response.statusCode); 
        var jsonData = jsonDecode(response.body);
print(jsonData); 
  Get.snackbar("Get Ride", "Successfully Store"); 
      }
    } catch (e) {
      print("Error $e");
    }
  }



 getMyTrips()async{
var token = _box.read(LocalStoreKey.token); 

    try {
      isLoading(true);
      var response = await http.get(Uri.parse("http://api.tripshiptask.com/api/mytrip"),
      headers: {
      
        'Accept':'application/json',
        'Authorization': 'Bearer '+token,
      },
     );
      if (response.statusCode == 200) {
      
        var jsonData = jsonDecode(response.body);
        print(jsonData); 
        update(); 
     return MyTripPostsModel.fromJson(jsonData); 
      }
    } catch (e) {
      print("Error $e");
    }
    update(); 
  }

   getMyTripsOffer()async{
var token = _box.read(LocalStoreKey.token); 

    try {
      isLoading(true);
      var response = await http.get(Uri.parse("http://api.tripshiptask.com/api/my-trip-offers"),
      headers: {
      
        'Accept':'application/json',
        'Authorization': 'Bearer '+token,
      },
     );
      if (response.statusCode == 200) {
      
        var jsonData = jsonDecode(response.body);
        print(jsonData); 
        update(); 
     return MyTripsOfferModel.fromJson(jsonData); 
      }
    } catch (e) {
      print("Error $e");
    }
    update(); 
  }
}