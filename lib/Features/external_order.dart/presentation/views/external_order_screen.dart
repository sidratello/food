import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/external_order_Controller.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/wedjet/CustomInputField.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:get/get.dart';

class AddAddressScreen extends StatelessWidget {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  AddAddressScreen({super.key});

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImageAsset.location_mage,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                    onPressed: () {
                      final controller = Get.put(ExternalOrderController());

                      controller.addExternalOrder(
                        orderType: "external",
                        addressOption: "manual",
                        manualOption: "new",
                        city: areaController.text,
                        street: streetController.text,
                        building: int.tryParse(buildingController.text) ?? 0,
                        floor: int.tryParse(floorController.text) ?? 0,
                        notes: detailsController.text,
                      );
                    },
                    child: const Text(
                      "إضافة عنوان",
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
