// To parse this JSON data, do
//
//     final myTripsOfferModel = myTripsOfferModelFromJson(jsonString);

import 'dart:convert';

MyTripsOfferModel myTripsOfferModelFromJson(String str) => MyTripsOfferModel.fromJson(json.decode(str));


class MyTripsOfferModel {
    List<Datum> data;

    MyTripsOfferModel({
        required this.data,
    });

    factory MyTripsOfferModel.fromJson(Map<String, dynamic> json) => MyTripsOfferModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

}

class Datum {
    String tripId;
    DateTime tripDate;
    String tripStartPoint;
    String tripDestination;
    int userId;
    int amount;
    dynamic co;
    int accepted;
    String path;

    Datum({
        required this.tripId,
        required this.tripDate,
        required this.tripStartPoint,
        required this.tripDestination,
        required this.userId,
        required this.amount,
        this.co,
        required this.accepted,
        required this.path,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tripId: json["trip_id"],
        tripDate: DateTime.parse(json["trip_date"]),
        tripStartPoint: json["trip_start_point"],
        tripDestination: json["trip_destination"],
        userId: json["user_id"],
        amount: json["amount"],
        co: json["co"],
        accepted: json["accepted"],
        path: json["path"],
    );

 
}
