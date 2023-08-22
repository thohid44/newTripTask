// To parse this JSON data, do
//
//     final tripPostDetailsModel = tripPostDetailsModelFromJson(jsonString);

import 'dart:convert';

TripPostDetailsModel tripPostDetailsModelFromJson(String str) => TripPostDetailsModel.fromJson(json.decode(str));



class TripPostDetailsModel {
    Data? data;

    TripPostDetailsModel({
        this.data,
    });

    factory TripPostDetailsModel.fromJson(Map<String, dynamic> json) => TripPostDetailsModel(
        data: Data.fromJson(json["data"]),
    );

}

class Data {
    String? title;
    int? id;
    String? tripId;
    String? postType;
    int? archived;
    String? status;
    String? slug;
    String? path;
    int? userId;
    String? country;
    String? currency;
    int? tripPosterRating;
    List<dynamic>? tripPosterFeedback;
    String? tripOwnerPhoto;
    String? vehicleType;
    String? vehicleName;
    String? startPoint;
    String? distance;
    String? duration;
    String? via;
    DateTime? date;
    String? time;
    String? seatsAvailable;
    String? destination;
    String? vehicleSeat;
    String? preferredPassenger;
    List<Bid>? bids;
    int? bidsCount;
    Point? point;
    Userinfo? userinfo;
    String? pay;
    dynamic? details;
    String? user;
    dynamic? facebook;
    int? totalTrip;
    DateTime? createdAt;
    String? userCreated;

    Data({
        this.title,
        this.id,
        this.tripId,
        this.postType,
        this.archived,
        this.status,
        this.slug,
        this.path,
        this.userId,
        this.country,
        this.currency,
        this.tripPosterRating,
        this.tripPosterFeedback,
        this.tripOwnerPhoto,
        this.vehicleType,
        this.vehicleName,
        this.startPoint,
        this.distance,
        this.duration,
        this.via,
        this.date,
        this.time,
        this.seatsAvailable,
        this.destination,
        this.vehicleSeat,
        this.preferredPassenger,
        this.bids,
        this.bidsCount,
        this.point,
        this.userinfo,
        this.pay,
        this.details,
        this.user,
        this.facebook,
        this.totalTrip,
        this.createdAt,
        this.userCreated,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        id: json["id"],
        tripId: json["trip_id"],
        postType: json["post_type"],
        archived: json["archived"],
        status: json["status"],
        slug: json["slug"],
        path: json["path"],
        userId: json["user_id"],
        country: json["country"],
        currency: json["currency"],
        tripPosterRating: json["trip_poster_rating"],
        tripPosterFeedback: List<dynamic>.from(json["trip_poster_feedback"].map((x) => x)),
        tripOwnerPhoto: json["trip_owner_photo"],
        vehicleType: json["vehicle_type"],
        vehicleName: json["vehicle_name"],
        startPoint: json["start_point"],
        distance: json["distance"],
        duration: json["duration"],
        via: json["via"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        seatsAvailable: json["seats_available"],
        destination: json["destination"],
        vehicleSeat: json["vehicle_seat"],
        preferredPassenger: json["preferred_passenger"],
        bids: List<Bid>.from(json["bids"].map((x) => Bid.fromJson(x))),
        bidsCount: json["bids_count"],
        point: Point.fromJson(json["point"]),
        userinfo: Userinfo.fromJson(json["userinfo"]),
        pay: json["pay"],
        details: json["details"],
        user: json["user"],
        facebook: json["facebook"],
        totalTrip: json["total_trip"],
        createdAt: DateTime.parse(json["created_at"]),
        userCreated: json["user_created"],
    );

   
}

class Bid {
    int? id;
    int? userId;
    int? tripId;
    String? title;
    String? tripUsername;
    dynamic completedRating;
    String? postedRating;
    int? amount;
    int? tripOwner;
    dynamic?  vehicleType;
    String? coverLetter;
    String? bidderName;
    String? bidderNumber;
    String? bidderEmail;
    dynamic bidderLocation;
    String? bidderEducation;
    String? bidderProfession;
    DateTime bidderDob;
    String? bidderSex;
    dynamic co;
    int? passenger;
    int? posted;
    int? completed;
    int? agree;
    int? complete;
    int? accepted;
    int? paid;
    dynamic paymentMethod;
    int? feedbackGiven;
    int? feedbackGot;
    String? photo;
    List<dynamic> tripPostedFeedback;
    List<dynamic> tripCompletedFeedback;
    int? passengerAccepted;

    Bid({
        this.id,
        this.userId,
        this.tripId,
        this.title,
        this.tripUsername,
        this.completedRating,
        this.postedRating,
        this.amount,
        this.tripOwner,
        this.vehicleType,
        this.coverLetter,
        this.bidderName,
        this.bidderNumber,
        this.bidderEmail,
        this.bidderLocation,
        this.bidderEducation,
        this.bidderProfession,
        this.bidderDob,
        this.bidderSex,
        this.co,
        this.passenger,
        this.posted,
        this.completed,
        this.agree,
        this.complete,
        this.accepted,
        this.paid,
        this.paymentMethod,
        this.feedbackGiven,
        this.feedbackGot,
        this.photo,
        this.tripPostedFeedback,
        this.tripCompletedFeedback,
        this.passengerAccepted,
    });

    factory Bid.fromJson(Map<String, dynamic> json) => Bid(
        id: json["id"],
        userId: json["user_id"],
        tripId: json["trip_id"],
        title: json["title"],
        tripUsername: json["trip_username"],
        completedRating: json["completed_rating"],
        postedRating: json["posted_rating"],
        amount: json["amount"],
        tripOwner: json["trip_owner"],
        vehicleType: json["vehicle_type"],
        coverLetter: json["cover_letter"],
        bidderName: json["bidder_name"],
        bidderNumber: json["bidder_number"],
        bidderEmail: json["bidder_email"],
        bidderLocation: json["bidder_location"],
        bidderEducation: json["bidder_education"],
        bidderProfession: json["bidder_profession"],
        bidderDob: DateTime.parse(json["bidder_dob"]),
        bidderSex: json["bidder_sex"],
        co: json["co"],
        passenger: json["passenger"],
        posted: json["posted"],
        completed: json["completed"],
        agree: json["agree"],
        complete: json["complete"],
        accepted: json["accepted"],
        paid: json["paid"],
        paymentMethod: json["payment_method"],
        feedbackGiven: json["feedback_given"],
        feedbackGot: json["feedback_got"],
        photo: json["photo"],
        tripPostedFeedback: List<dynamic>.from(json["trip_posted_feedback"].map((x) => x)),
        tripCompletedFeedback: List<dynamic>.from(json["trip_completed_feedback"].map((x) => x)),
        passengerAccepted: json["passenger_accepted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "trip_id": tripId,
        "title": title,
        "trip_username": tripUsername,
        "completed_rating": completedRating,
        "posted_rating": postedRating,
        "amount": amount,
        "trip_owner": tripOwner,
        "vehicle_type": vehicleType,
        "cover_letter": coverLetter,
        "bidder_name": bidderName,
        "bidder_number": bidderNumber,
        "bidder_email": bidderEmail,
        "bidder_location": bidderLocation,
        "bidder_education": bidderEducation,
        "bidder_profession": bidderProfession,
        "bidder_dob": "${bidderDob.year.toString().padLeft(4, '0')}-${bidderDob.month.toString().padLeft(2, '0')}-${bidderDob.day.toString().padLeft(2, '0')}",
        "bidder_sex": bidderSex,
        "co": co,
        "passenger": passenger,
        "posted": posted,
        "completed": completed,
        "agree": agree,
        "complete": complete,
        "accepted": accepted,
        "paid": paid,
        "payment_method": paymentMethod,
        "feedback_given": feedbackGiven,
        "feedback_got": feedbackGot,
        "photo": photo,
        "trip_posted_feedback": List<dynamic>.from(tripPostedFeedback.map((x) => x)),
        "trip_completed_feedback": List<dynamic>.from(tripCompletedFeedback.map((x) => x)),
        "passenger_accepted": passengerAccepted,
    };
}

class Point {
    String sLat;
    String sLng;
    String dLat;
    String dLng;

    Point({
        this.sLat,
        this.sLng,
        this.dLat,
        this.dLng,
    });

    factory Point.fromJson(Map<String, dynamic> json) => Point(
        sLat: json["s_lat"],
        sLng: json["s_lng"],
        dLat: json["d_lat"],
        dLng: json["d_lng"],
    );

    Map<String, dynamic> toJson() => {
        "s_lat": sLat,
        "s_lng": sLng,
        "d_lat": dLat,
        "d_lng": dLng,
    };
}

class Userinfo {
    String name;
    String created;
    String education;
    String profession;
    DateTime dob;
    String gender;

    Userinfo({
        this.name,
        this.created,
        this.education,
        this.profession,
        this.dob,
        this.gender,
    });

    factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        name: json["name"],
        created: json["created"],
        education: json["education"],
        profession: json["profession"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "created": created,
        "education": education,
        "profession": profession,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}
