
import 'dart:convert';

import 'package:bus/Api_services/base_url.dart';

import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/controller/vehicle_model.dart';
import 'package:bus/pages/TripPages/model/my_trip_posts_model.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class VehicleController extends GetxController{
var isLoading = false.obs; 
final _box = GetStorage(); 


List<VehiclesModel> myVehicles = <VehiclesModel>[].obs;

   getMyVehicles() async {
    var token = _box.read(LocalStoreKey.token);

    try {
      isLoading(true);
      myVehicles.clear();
      var response = await http.get(
        Uri.parse("${baseUrl}getvehiclesinfo?vehicle=car&user=231"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token,
        },
      );
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
 
    VehicleModel data = VehicleModel.fromJson(jsonData); 
       
        myVehicles = data.data!;
      update();
        
      }
    } catch (e) {
      print("Error $e");
    }
  
  }


}