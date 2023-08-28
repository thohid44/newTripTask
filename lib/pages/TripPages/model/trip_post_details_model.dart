import 'dart:convert';

TripPostDetailsModel tripPostDetailsModelFromJson(String str) =>
    TripPostDetailsModel.fromJson(json.decode(str));

class TripPostDetailsModel {
  Data? data;

  TripPostDetailsModel({
    this.data,
  });

  factory TripPostDetailsModel.fromJson(Map<String, dynamic> json) =>
      TripPostDetailsModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  String? title;
  var id;
  String? tripId;
  String? postType;
  var archived;
  String? status;
  String? slug;
  String? path;
  var userId;
  String? country;
  String? currency;
  var tripPosterRating;
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
  var bidsCount;

  String? pay;
  dynamic? details;
  String? user;
  dynamic? facebook;
  var totalTrip;
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

    this.pay,
    this.details,
    this.user,
    this.facebook,
    this.totalTrip,
    this.createdAt,
    this.userCreated,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"].toString(),
        id: json["id"].toString(),
        tripId: json["trip_id"].toString(),
        postType: json["post_type"].toString(),
        archived: json["archived"].toString(),
        status: json["status"].toString(),
        slug: json["slug"].toString(),
        path: json["path"].toString(),
        userId: json["user_id"].toString(),
        country: json["country"].toString(),
        currency: json["currency"].toString(),
        tripPosterRating: json["trip_poster_rating"].toString(),
        tripPosterFeedback:
            List<dynamic>.from(json["trip_poster_feedback"].map((x) => x)),
        tripOwnerPhoto: json["trip_owner_photo"].toString(),
        vehicleType: json["vehicle_type"].toString(),
        vehicleName: json["vehicle_name"].toString(),
        startPoint: json["start_point"].toString(),
        distance: json["distance"].toString(),
        duration: json["duration"].toString(),
        via: json["via"].toString(),
        date: DateTime.parse(json["date"]),
        time: json["time"].toString(),
        seatsAvailable: json["seats_available"].toString(),
        destination: json["destination"].toString(),
        vehicleSeat: json["vehicle_seat"].toString(),
        preferredPassenger: json["preferred_passenger"].toString(),
        bids: List<Bid>.from(json["bids"].map((x) => Bid.fromJson(x))),
        bidsCount: json["bids_count"].toString(),
 
        pay: json["pay"].toString(),
        details: json["details"].toString(),
        user: json["user"].toString(),
        facebook: json["facebook"].toString().toString(),
        totalTrip: json["total_trip"].toString(),
        createdAt: DateTime.parse(json["created_at"]),
        userCreated: json["user_created"].toString(),
      );
}

class Bid {
  var id;
  var userId;
  var tripId;
  var title;
  var tripUsername;
  dynamic completedRating;
  var postedRating;
  var amount;
  var tripOwner;
  dynamic? vehicleType;
  var coverLetter;
  var bidderName;
  var bidderNumber;
  var bidderEmail;
  dynamic? bidderLocation;
  var bidderEducation;
  var bidderProfession;
  DateTime? bidderDob;
  var bidderSex;
  dynamic co;
  var passenger;
  var posted;
  var completed;
  var agree;
  var complete;
  var accepted;
  var paid;
  dynamic? paymentMethod;
  var feedbackGiven;
  var feedbackGot;
  String? photo;
  List<dynamic>? tripPostedFeedback;
  List<dynamic>? tripCompletedFeedback;
  var passengerAccepted;

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
        tripPostedFeedback:
            List<dynamic>.from(json["trip_posted_feedback"].map((x) => x)),
        tripCompletedFeedback:
            List<dynamic>.from(json["trip_completed_feedback"].map((x) => x)),
        passengerAccepted: json["passenger_accepted"],
      );
}


