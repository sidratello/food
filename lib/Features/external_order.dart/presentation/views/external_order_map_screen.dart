import 'dart:async'; // StreamSubscription
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/external_order_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

// NOTE: keep your actual controller import path
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/external_order_map_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final Location _location = Location();

  // GetX controller (avoid double registration)
  late final ExternalOrderMapController orderController;

  StreamSubscription<LocationData>? _locationSub;

  LocationData? currentLocation; // موقع المستخدم الحالي
  LatLng? selectedPoint;         // النقطة التي يختارها المستخدم
  final List<Marker> markers = [];

  @override
  void initState() {
    super.initState();

    // استخدم نسخة واحدة من الكونترولر
    orderController = Get.isRegistered<ExternalOrderMapController>()
        ? Get.find<ExternalOrderMapController>()
        : Get.put(ExternalOrderMapController());

    _initLocation();
  }

  /// تهيئة وإحضار الموقع + الاستماع للتغييرات
  Future<void> _initLocation() async {
    try {
      // بإمكانك إضافة طلب الإذن/تشغيل الخدمة هنا لو أردت تشديد الإجراءات
      final userLocation = await _location.getLocation();
      if (!mounted) return;
      setState(() => currentLocation = userLocation);

      // ضع ماركر مبدئي على موقع المستخدم (اختياري)
      _updateMarker(LatLng(userLocation.latitude!, userLocation.longitude!));

      // الاستماع للتغييرات، وتخزين الاشتراك لإلغائه لاحقًا
      _locationSub = _location.onLocationChanged.listen((newLoc) {
        if (!mounted) return;
        setState(() => currentLocation = newLoc);
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => currentLocation = null);
    }
  }

  /// تحديث الماركر عند النقر على الخريطة
  void _updateMarker(LatLng point) {
    if (!mounted) return;
    setState(() {
      selectedPoint = point;
      markers
        ..clear()
        ..add(
          Marker(
            width: 80,
            height: 80,
            point: point,
            child: const Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        );
    });
  }

  /// تحريك الكاميرا إلى موقعي الحالي
  void _goToMyLocation() {
    if (currentLocation == null) return;
    mapController.move(
      LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      15,
    );
  }
  void _confirmAndGoNext() {
    if (selectedPoint == null) {
      Get.snackbar("تنبيه", "الرجاء اختيار موقع أولاً",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.to(() => AddAddressScreen(initialPoint: selectedPoint!));
  }
  /// إرسال الطلب عبر الكونترولر
  void _confirmAndSendOrder() {
    if (selectedPoint == null) {
      Get.snackbar("تنبيه", "الرجاء اختيار موقع أولاً",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    orderController.addExternalOrdermap(
      orderType: "external", // المهم: external حسب الباك-إند لديك
      addressOption: "auto",
      longitude: selectedPoint!.longitude,
      latitude: selectedPoint!.latitude,
    );
  }

  @override
  void dispose() {
    // إلغاء الاستماع لتغييرات الموقع لمنع setState بعد إغلاق الشاشة
    _locationSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialCenter = currentLocation != null
        ? LatLng(currentLocation!.latitude!, currentLocation!.longitude!)
        : const LatLng(33.5138, 36.2765); // دمشق كافتراضي

    return WillPopScope(
      // امنع الرجوع أثناء الإرسال لتفادي أي سباقات حالة (race conditions)
      onWillPop: () async => !orderController.isSending.value,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تحديد الموقع'),
          actions: [
            if (selectedPoint != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: Text(
                    "lat: ${selectedPoint!.latitude.toStringAsFixed(5)}, "
                    "lng: ${selectedPoint!.longitude.toStringAsFixed(5)}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
        body: currentLocation == null
            ? const Center(child: CircularProgressIndicator())
            : FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: initialCenter,
                  initialZoom: 15.0,
                  onTap: (tapPosition, point) => _updateMarker(point),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=5Gqx8ipY4KY66zx1KRnB',
                    userAgentPackageName: 'com.example.flutter_application_7',
                    tileProvider: NetworkTileProvider(),
                  ),
                  MarkerLayer(markers: markers),
                ],
              ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'myLoc',
              onPressed: _goToMyLocation,
              child: const Icon(Icons.my_location),
            ),
            const SizedBox(height: 12),
          FloatingActionButton.extended(
        
  heroTag: 'confirm',
  onPressed:  _confirmAndGoNext,
  label: const Text("تأكيد الموقع"),
  icon: const Icon(Icons.check),
),
                
          ],
        ),
      ),
    );
  }
}
































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





// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/external_order_map_controller.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';
// import 'package:get/get.dart';


// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final MapController mapController = MapController();
//   final Location _location = Location();
//   final ExternalOrderMapController orderController =
//       Get.put(ExternalOrderMapController());

//   LocationData? currentLocation;
//   LatLng? selectedPoint;
//   final List<Marker> markers = [];

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       final loc = await _location.getLocation();
//       setState(() => currentLocation = loc);

//       // ضع ماركر للموقع الحالي
//       _updateMarker(LatLng(loc.latitude!, loc.longitude!));
//     } catch (e) {
//       print("⚠️ Error getting location: $e");
//     }
//   }

//   /// تحديث الماركر للموقع المحدد
//   void _updateMarker(LatLng point) {
//     setState(() {
//       selectedPoint = point;
//       markers
//         ..clear()
//         ..add(
//           Marker(
//             width: 80,
//             height: 80,
//             point: point,
//             child: const Icon(Icons.location_on, color: Colors.red, size: 40),
//           ),
//         );
//     });
//   }

//   /// إرسال الطلب عبر الكونترولر
//   void _confirmAndSendOrder() {
//     if (selectedPoint == null) {
//       Get.snackbar("تنبيه", "الرجاء اختيار موقع أولاً",
//           snackPosition: SnackPosition.BOTTOM);
//       return;
//     }

//     orderController.addExternalOrdermap(
//       orderType: "delivery", // عدلها حسب المطلوب من API
//       addressOption: "auto", // خيار العنوان من الخريطة
//       longitude: selectedPoint!.longitude,
//       latitude: selectedPoint!.latitude,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final initialCenter = currentLocation != null
//         ? LatLng(currentLocation!.latitude!, currentLocation!.longitude!)
//         : const LatLng(33.5138, 36.2765); // افتراضي دمشق

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تحديد الموقع'),
//       ),
//       body: currentLocation == null
//           ? const Center(child: CircularProgressIndicator())
//           : FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 initialCenter: initialCenter,
//                 initialZoom: 15.0,
//                 onTap: (tapPosition, point) => _updateMarker(point),
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate:
//                       'https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=YOUR_MAP_KEY',
//                   userAgentPackageName: 'com.example.flutter_application_7',
//                   tileProvider: NetworkTileProvider(),
//                 ),
//                 MarkerLayer(markers: markers),
//               ],
//             ),
//       floatingActionButton: Obx(() {
//         return FloatingActionButton.extended(
//           onPressed: orderController.isSending.value
//               ? null
//               : _confirmAndSendOrder,
//           label: orderController.isSending.value
//               ? const Text("جاري الإرسال...")
//               : const Text("تأكيد وإرسال الطلب"),
//           icon: const Icon(Icons.send),
//         );
//       }),
//     );
//   }
// }
