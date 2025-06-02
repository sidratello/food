import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {

  late   CameraPosition initialCameraPosition;
late GoogleMapController googleMapController;
Set<Marker> markers={};
Set<Polyline>polylines={};

late Location location;

@override
  void initState() {

    initialCameraPosition =CameraPosition(
      target: LatLng(33.50343738028056, 36.27239794254358),
      zoom: 16,
      );
    initMarkers();
    initPolylines();
    location=Location();
  }
  void dispose(){
    googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      
         GoogleMap(
          polylines:polylines ,
      zoomControlsEnabled: false,
          markers: markers,
      onMapCreated: (controller){
        googleMapController=controller;
      },
       mapType: MapType.normal,
          initialCameraPosition:initialCameraPosition,),
      
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,          
            child: ElevatedButton(onPressed: (){
      
            }, child: Text("change location")))
        ],
      ),
    );
  }
  
  void initMarkers() {

var myMarker=Marker(markerId:MarkerId('1'),position: LatLng(33.50333036680501, 36.27242972960311));
  setState(() {
    markers.add(myMarker);
  });

  }
  
  void initPolylines() {
Polyline polyline =const Polyline(
  width: 5,
  color: Colors.red,
  startCap: Cap.squareCap,
  polylineId: PolylineId('1'));
polylines.add(polyline);
Point:[

// LatLng(latitude, longitude),

];


  }


  void getlocationdata(){
location.onLocationChanged.listen(

(LocationData){




}



);

  }


}