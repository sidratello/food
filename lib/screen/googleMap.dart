// import 'dart:convert';
// import 'dart:ffi';
// import 'package:http/http.dart'as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final MapController mapController=MapController(); //move camera from place to place 
//   LocationData? currentlocation; //this LocationData is from lacation package that have information about the latitude (خط العرض)

// // longitude (خط الطول)

// // altitude (الارتفاع)

// // speed (السرعة)

// // وغيرها من بيانات الموقع.


// List<LatLng>routepoints=[]; //for space btween two point i want to  now cordinate of two point
// List<Marker>markers=[]; // mark that about location alalama 
// final String orsApiKey='5b3ce3597851110001cf6248f9b0dc836e4748f6824f8831c2817bd8';


// @override
// void initState() {
//   super.initState();
//   _getCurrentLocation();
// }

// Future<void> _getCurrentLocation()async{
//   var location=Location(); //instance in location package

//   try{
// var userlocation=await location.getLocation();   //the curent location of user 
// setState(() {
//   currentlocation=userlocation;
//   markers.add(
//    Marker(
//     width: 80.0,
//     height: 80.0,
//     point: LatLng(userlocation.latitude!,userlocation.longitude!),
//   child:const Icon(Icons.my_location,color: Colors.blue,size: 40,),), 
//   );
// });

//   }
// on Exception{
//   currentlocation=null;

// }
// location.onLocationChanged.listen((LocationData newlocation) {
// setState(() {
//   currentlocation=newlocation;
// });

//  });
// }
// Future<void> _getroute (LatLng distination)async{

// if(currentlocation==null)
// return;

//  final start=LatLng(currentlocation!.latitude!, currentlocation!.longitude!);

//  final response =await http.get(
//   Uri.parse('https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${distination.longitude},${distination.latitude}'),
//  );

//  if(response.statusCode==200){

// final data=json.decode(response.body);
// final List<dynamic>coords=data['features'][0]['geometry']['coordinates'];
// setState(() {
  
//   routepoints=coords.map((coord) => LatLng(coord[1], coord[0])).toList();
//   markers.add(
//     Marker(
//       width: 80.0,
//       height: 80.0,
//       point:distination,
//  child: Icon(
//   Icons.location_on,color: Colors.red,size: 40,

//  ),
//  ),
//   );
// });
//  }
// else{

//   print(
//     'Faild to fitch route');
// }

// }
// void _adddistinationMarker(LatLng point){
//   setState(() {
//     markers.add(
//       Marker(
//      width: 80.0,
//     height: 80.0,
//     point: point,
//   child:const Icon(Icons.location_on,color: Colors.blue,size: 40,),),
//     );
//   });

//   _getroute(point);
// }


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
// return Scaffold(
// appBar: AppBar(
//   title: const Text('Location'),
// ),
// body: currentlocation==null?
// const Center(
//   child: CircularProgressIndicator(),
// ):FlutterMap(
//   mapController: mapController,
// options: MapOptions(
//   initialCenter: LatLng(33.5138, 36.2765), // دمشق دائماً بالبداية
//   initialZoom: 15.0,
//   onTap: (tapPosition, point) => _adddistinationMarker(point),
// ),

//  children:[ 
// TileLayer(

//   urlTemplate: 'https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=5Gqx8ipY4KY66zx1KRnB',


//   userAgentPackageName: 'com.example.flutter_application_7',
//   tileProvider: NetworkTileProvider(),
// ),



//  MarkerLayer(
//   markers: markers
//  ),
//  PolylineLayer(polylines:[
//   Polyline(points: 
//   routepoints,
//   strokeWidth: 4,
//   color: Colors.blue,

//   )
//  ] 
//  ),

//  ],
//  ),
//  floatingActionButton: FloatingActionButton(
//   onPressed: (){
//     if(currentlocation!=null){
//       mapController.move(
//         LatLng(currentlocation!.latitude!, currentlocation!.longitude!),15);

//     }
//   },
//   child: const Icon(Icons.my_location),
//  ),


// );
//   }
//   }
































// // //🧭 ما هو MapController؟
// // MapController هو أداة للتحكم في الخريطة بشكل برمجي داخل مكتبة flutter_map.

// // بمعنى آخر، هو زي "ريموت كنترول" للخريطة، يسمح لك بـ:

// // تحريك الكاميرا (الخريطة) لموقع معين.

// // تكبير أو تصغير الخريطة.

// // جلب موقع المركز الحالي على الخريطة.

// // الاستماع لتغيّرات الخريطة.

// // ✅ لماذا نستخدمه؟
// // لأننا أحيانًا نحتاج نحرك الخريطة من الكود، مثلاً:

// // لما المستخدم يفتح التطبيق وتريد توجيه الكاميرا إلى موقعه الحالي.

// // أو لما المستخدم يضغط زر معين فتروح الخريطة لمكان آخر.

// // كل هذا ما تقدر تسويه بدون MapController.


// // ما هو LatLng كنوع بيانات؟ ولماذا نستخدمه في List<LatLng> routepoints = [];؟

// // 🔷 1. ما هو LatLng؟
// // LatLng هو كائن (object) من مكتبة latlong2، يمثل نقطة على الخريطة.

// // Lat = Latitude = خط العرض (مثلاً: 24.7136)

// // Lng = Longitude = خط الطول (مثلاً: 46.6753)

// // ✅ مثال:
// // dart
// // Copy
// // Edit
// // LatLng myPoint = LatLng(24.7136, 46.6753);
// // هذا يمثّل نقطة في مدينة الرياض مثلاً.


// // 1. ما هو Marker؟
// // Marker هو كائن (object) من مكتبة [flutter_map] يُستخدم لعرض علامة على الخريطة.

// // يعني باختصار:

// // Marker = دبوس أو رمز صغير تحطه في مكان معين على الخريطة (زي اللي يظهر لك في Google Maps).

// // كل Marker يحتوي على:

// // موقع (lat, lng)

// // حجم (width, height)

// // عنصر مرئي (Widget) زي Icon, Container, Image, إلخ





