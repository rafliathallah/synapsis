import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location_service.dart';





class GMaps extends StatelessWidget {
  
static final Completer<GoogleMapController> _controller = Completer();
  const GMaps({Key? key}) : super(key: key);

static const CameraPosition defauld = CameraPosition(target: LatLng(0, 0),zoom: 0);
static final CameraPosition now = CameraPosition(target:  LatLng(UserLocation.lat,UserLocation.long),zoom: 20);

static void onMapCreated(GoogleMapController controller) {
    controller.animateCamera(CameraUpdate.newCameraPosition(now));
    print("now $now");
    _controller.complete(controller);
}

 @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35)
        ),
        child: GoogleMap(
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: defauld,
          onMapCreated: onMapCreated
          ),
      ),
      
    );
  }
}