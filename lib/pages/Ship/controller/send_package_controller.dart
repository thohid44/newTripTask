import 'package:bus/Api_services/ApiService.dart';
import 'package:get/get.dart';


class SendPackageController extends GetxController{


sendPackage(String pickup, String pickDate, String pickTime, String dropOff,   deliveryTime,  deliveryDate, String currency, String sendItem, String goodType, String approxiValue, String packageType, String weight, String note,) async{
   var mapData = {
    "post_type": "enim",
    "pickuppoint": pickup,
    "date": pickDate,
    "time": '5:00',
    "delivery_date": '10:00',
    "delivery_time": deliveryDate,
    "dropoffpoint": dropOff,
    "distance": approxiValue,
    "duration": "quidem",
    "amount": "enim",
    "p_lat": "ut",
    "p_lng": "quidem",
    "d_lat": "alias",
    "d_lng": "fugit",
    "document": "ut",
    "packagetype": packageType,
    "weight": weight,
    "goodtype": goodType,
    "length": "illo",
    "width": "officiis",
    "height": "inventore",
    "document_worth": "atque",
    "ownvehicle": "molestiae",
    "country": "omnis",
    "currency": currency,
    "notes": note
}
; 
    var response = await ApiService().postData(mapData, "ship"); 
    if(response.StatusCode==201){

    print(response.body); 
    }
  }
}