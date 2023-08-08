import 'dart:convert';

import 'package:bus/Utils/localstorekey.dart';
import 'package:bus/pages/Home/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isRegLoading = false.obs;
  final _box = GetStorage();
  var userClient = http.Client();
  var url = "http://api.tripshiptask.com/api/auth/login";
  login(email, password) async {
    var mapData = {"email": "waleed.amin08@gmail.com", "password": "123456789"};
    try {
      isLoading(true);
      var response = await http.post(Uri.parse(url), body: mapData);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        var getToken = jsonData['access_token'];
        _box.write(LocalStoreKey.token, getToken);
        print(_box.read(LocalStoreKey.token));
        if (getToken != null) {
          Get.to(HomeScreen());
        }
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print("Error $e");
    }
  }

  registration({name, phone, email, gender, password}) async {
    var mapData = {
      "name": name,
      "mobile": phone,
      "email": email,
      "gender": gender,
      "password": password
    };
    try {
      isRegLoading(true);
      var response = await http.post(Uri.parse(url), body: mapData);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        var getToken = jsonData['access_token'];
        _box.write(LocalStoreKey.token, getToken);
        print(_box.read(LocalStoreKey.token));
        if (getToken != null) {}
      }
      isRegLoading(false);
    } catch (e) {
      isRegLoading(false);
      print("Error $e");
    }
  }
}
