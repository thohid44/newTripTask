// To parse this JSON data, do
//
//     final myTaskModel = myTaskModelFromJson(jsonString);

import 'dart:convert';

MyTaskModel myTaskModelFromJson(String str) => MyTaskModel.fromJson(json.decode(str));



class MyTaskModel {
    Data? data;

    MyTaskModel({
        this.data,
    });

    factory MyTaskModel.fromJson(Map<String, dynamic> json) => MyTaskModel(
        data: Data.fromJson(json["data"]),
    );

}

class Data {
    List<OfferTask>? offerTasks;
    List<dynamic>? seekedTasks;
    List<dynamic>? completedTasks;

    Data({
        this.offerTasks,
        this.seekedTasks,
        this.completedTasks,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offerTasks: List<OfferTask>.from(json["offer_tasks"].map((x) => OfferTask.fromJson(x))),
        seekedTasks: List<dynamic>.from(json["seeked_tasks"].map((x) => x)),
        completedTasks: List<dynamic>.from(json["completed_tasks"].map((x) => x)),
    );

   
}

class OfferTask {
    List<String>? skills;
    String? category;
    int? id;
    int? userId;
    String? title;
    String? taskId;
    String? slug;
    String? postType;
    String? path;
    dynamic taskRating;
    LatLng? latLng;
    String? location;
    String? description;
    String? status;
    int? personNeed;
    DateTime? date;
    String? time;
    int? hour;
    int? amount;
    String? user;
    DateTime? createdAt;

    OfferTask({
        this.skills,
        this.category,
        this.id,
        this.userId,
        this.title,
        this.taskId,
        this.slug,
        this.postType,
        this.path,
        this.taskRating,
        this.latLng,
        this.location,
        this.description,
        this.status,
        this.personNeed,
        this.date,
        this.time,
        this.hour,
        this.amount,
        this.user,
        this.createdAt,
    });

    factory OfferTask.fromJson(Map<String, dynamic> json) => OfferTask(
        skills: List<String>.from(json["skills"].map((x) => x)),
        category: json["category"],
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        taskId: json["task_id"],
        slug: json["slug"],
        postType: json["post_type"],
        path: json["path"],
        taskRating: json["task_rating"],
        latLng: LatLng.fromJson(json["lat_lng"]),
        location: json["location"],
        description: json["description"],
        status: json["status"],
        personNeed: json["person_need"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        hour: json["hour"],
        amount: json["amount"],
        user: json["user"],
        createdAt: DateTime.parse(json["created_at"]),
    );

 
}

class LatLng {
    double? lat;
    double? lng;

    LatLng({
        this.lat,
        this.lng,
    });

    factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}
