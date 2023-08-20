// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bus/Utils/map_utils.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

class MapScreen extends StatefulWidget {
  final DetailsResult? startPosition;
  final DetailsResult? endPosition;

  const MapScreen({Key? key, this.startPosition, this.endPosition})
      : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition _initialPosition;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialPosition = CameraPosition(
      // target: LatLng(widget.startPosition!.geometry!.location!.lat!,
      //     widget.startPosition!.geometry!.location!.lng!),
           target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
     
        // onMapCreated: (GoogleMapController controller) {
        //   Future.delayed(
        //       Duration(milliseconds: 200),
        //       () => controller.animateCamera(CameraUpdate.newLatLngBounds(
        //           MapUtils.boundsFromLatLngList(
        //               _markers.map((loc) => loc.position).toList()),
        //           1)));
        // },
      ),
    );
  }
}