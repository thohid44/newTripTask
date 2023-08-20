import 'dart:convert';

import 'package:bus/Api_services/ApiService.dart';
import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/pages/TripPages/model/my_trip_posts_model.dart';
import 'package:bus/pages/TripPages/model/my_trips_offer_model.dart';
import 'package:bus/pages/TripPages/model/trips_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class TripController extends GetxController {
  final _box = GetStorage();
  var isLoading = false.obs;
  List<TripSearchM> tripSearchList = <TripSearchM>[].obs;

  getTripRide(sPoint, des, note, prefered, howmany, currency, vehicled) async {
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
      var response = await ApiService().postData(mapData, "trip");

      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        Get.snackbar("Give Ride", "Successfully Store", 
        backgroundColor: navyBlueColor
        );
      }
    } catch (e) {
      print("Error $e");
    }
  }

  getMyTrips() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("http://api.tripshiptask.com/api/mytrip"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
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

  getMyTripsOffer() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("http://api.tripshiptask.com/api/my-trip-offers"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
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

  tripSearch(
      {startPoints,
      startRadius,
      startkm,
      destination,
      desRadius,
      deskm,
      vehicle}) async {
    var token = _box.read(LocalStoreKey.token);
    print("search token $token");
    try {
      isLoading(true);
      tripSearchList.clear();
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

        TripSearchModel data = TripSearchModel.fromJson(jsonData);
        tripSearchList = data.data!;
      }
       isLoading(false);
    } catch (e) {
      isLoading(false);
      print("Error $e");
    }
  }

    bidOnTrip(amount, tripId, seat,  message) async {
    var token = _box.read(LocalStoreKey.token);
    print(token);
    var mapData = {
    "amount": amount.toString(),
    "vehicle_seat": seat.toString(),
    "trip_id": tripId.toString(),
    "message": message
};

    try {
      isLoading(true);
      var response = await ApiService().postData(mapData, "tripbids");

      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        Get.snackbar("Trip Offer", "Make Successfully ", 
        backgroundColor: navyBlueColor
        );
      }
    } catch (e) {
      print("Error $e");
    }
  }


}
