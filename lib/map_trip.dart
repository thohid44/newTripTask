import 'dart:async';

import 'package:bus/pages/TripPages/views/my_trips_offer_page.dart';
import 'package:bus/profile/view/all_Trips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../pages/Task/views/task_home_page.dart';


class MapTrip extends StatefulWidget {
  const MapTrip();
  @override
  State<MapTrip> createState() => _MapTripState();
}

class _MapTripState extends State<MapTrip> {

  Completer<GoogleMapController> _controller = Completer(); 
  CameraPosition _kGooglPlex = CameraPosition(target: LatLng(22/99, 22.00));

  final Set<Marker> _markers = {}; 
  final Set<Polyline> _polyLine = {};
  List<LatLng> latLng ={};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: customAppBar(),
          body:Column(
            children: [
              
            ],
          )),
    );
  }
}
