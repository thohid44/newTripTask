import 'dart:convert';

import 'package:bus/Api_services/ApiService.dart';
import 'package:bus/Api_services/base_url.dart';
import 'package:bus/Utils/colors.dart';
import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/pages/TripPages/model/my_trip_posts_model.dart';
import 'package:bus/pages/TripPages/model/my_trips_offer_model.dart';
import 'package:bus/pages/TripPages/model/trip_post_details_model.dart';
import 'package:bus/pages/TripPages/model/trips_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class TripController extends GetxController {
  final _box = GetStorage();
  var isLoading = false.obs;
  List<TripSearchM> tripSearchList = <TripSearchM>[].obs;
  TripPostDetailsModel? tripPostDetailsModel;

  getTripRide({sPointLat, sPointLng, dPointLat, dPointLng, des, note, prefered, howmany, currency, vehicled}) async {
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
      "s_lat": sPointLat,
      "s_lng": sPointLng,
      "d_lat": dPointLat,
      "d_lng": dPointLng,
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
            backgroundColor: navyBlueColor);
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
        Uri.parse("${baseUrl}mytrip"),
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
        Uri.parse("${baseUrl}my-trip-offers"),
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



  bidOnTrip(amount, tripId, seat, message) async {
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
        print("offer $jsonData");
        Get.snackbar("Trip Offer", "Make Successfully ",
            backgroundColor: navyBlueColor);
      }
    } catch (e) {
      print("Error $e");
    }
  }

  acceptTrip(bidId, sum) async {
    var token = _box.read(LocalStoreKey.token);
    print(token);
    var mapData = {"accepted": "1", "totalpassenger": "4"};
    try {
      isLoading(true);
      //  var response = await ApiService().postData(mapData, "tripbids/$bidId");
      var response = await http.patch(Uri.parse("${baseUrl}tripbids/$bidId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: mapData);

      if (response.statusCode == 201) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print("offer $jsonData");
        Get.snackbar("Trip Offer", "Make Successfully ",
            backgroundColor: navyBlueColor);
      }
    } catch (e) {
      print("Error $e");
    }
  }

  counterTripOffer(bidId, amount) async {
    var token = _box.read(LocalStoreKey.token);

    var mapData = {"amount": amount};

    try {
      isLoading(true);
      //  var response = await ApiService().postData(mapData, "tripbids/$bidId");
      var response = await http.patch(Uri.parse("${baseUrl}tripbids/$bidId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: mapData);

      print(response.statusCode);

      // if (response.statusCode == 200) {
      //   print(response.statusCode);
      //   var jsonData = jsonDecode(response.body);
      //   print("counter offer $jsonData");
      //   Get.snackbar("Trip Offer", "Make Successfully ",
      //       backgroundColor: navyBlueColor);
      // }
    } catch (e) {
      print("Error $e");
    }
  }

 tripAgree(bidId) async {
    var token = _box.read(LocalStoreKey.token);

    var mapData =   {
    "agree": '1'
};

    try {
      isLoading(true);
      //  var response = await ApiService().postData(mapData, "tripbids/$bidId");
      var response = await http.patch(Uri.parse("${baseUrl}tripbids/$bidId"),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
          body: mapData);

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonData = jsonDecode(response.body);
        print("counter offer $jsonData");
        Get.snackbar("Trip Offer", "Make Successfully ",
            backgroundColor: navyBlueColor);
      }
    } catch (e) {
      print("Error $e");
    }
  }
  var path1 = ''.obs;
  getTripPostDetails(path) async {
    var token = _box.read(LocalStoreKey.token);

    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("${urlWithOutslash}$path"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData);
        tripPostDetailsModel = TripPostDetailsModel.fromJson(jsonData);
        update();
      }
    } catch (e) {
      print("Error $e");
      isLoading(false);
    }
    update();
  }
}
