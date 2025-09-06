import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/external_order_Controller.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/wedjet/CustomInputField.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class AddAddressScreen extends StatefulWidget {
  final LatLng? initialPoint; // ⬅️ تأتي من MapScreen
  const AddAddressScreen({super.key, this.initialPoint});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة عنوان"),
      
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ✅ صورة الخريطة
           // داخل الـ Column
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: SizedBox(
    height: 200,
    width: double.infinity,
    child: widget.initialPoint == null
        // في حال ما فيه إحداثيات (احتياطي) خلي الصورة
        ? Image.asset(
            AppImageAsset.location_mage,
            fit: BoxFit.cover,
          )
        // في حال فيه إحداثيات نعرض الخريطة
        : FlutterMap(
            options: MapOptions(
              initialCenter: widget.initialPoint!,
              initialZoom: 16,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.none, // منع التحريك والتكبير
              ),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=5Gqx8ipY4KY66zx1KRnB',
                userAgentPackageName: 'com.example.flutter_application_7',
                tileProvider: NetworkTileProvider(),
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 60,
                    height: 60,
                    point: widget.initialPoint!,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ],
          ),
  ),
),

                  const SizedBox(height: 20),

                  // ✅ حقول الإدخال
                  CustomInputField(
                    controller: areaController,
                    label: "اسم المنطقة",
                    icon: Icons.location_city,
                  ),
                  CustomInputField(
                    controller: streetController,
                    label: "اسم الشارع",
                    icon: Icons.streetview,
                  ),
                  CustomInputField(
                    controller: buildingController,
                    label: "رقم البناء",
                    icon: Icons.home,
                    keyboardType: TextInputType.number,
                  ),
                  CustomInputField(
                    controller: floorController,
                    label: "رقم الطابق",
                    icon: Icons.format_list_numbered,
                    keyboardType: TextInputType.number,
                  ),
                  CustomInputField(
                    controller: detailsController,
                    label: "تفاصيل إضافية",
                    icon: Icons.warning,
                  ),

                  const SizedBox(height: 20),

                  // ✅ زر الإرسال
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 244, 190, 203),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: ()async {
                      final controller = Get.put(ExternalOrderController());

                  final ok  =await  controller.addExternalOrder(
                        orderType: "external",
                        addressOption: "manual",
                        manualOption: "new",
                        city: areaController.text,
                        street: streetController.text,
                        building: int.tryParse(buildingController.text) ?? 0,
                        floor: int.tryParse(floorController.text) ?? 0,
                        notes: detailsController.text,
                      );
                        if (ok) {
    Get.back(result: true); // مهم جداً
  }
                    },
                    child: const Text(
                      "حفظ العنوان",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
