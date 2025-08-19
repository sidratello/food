import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/external_order_map_screen.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/external_order_screen.dart';
import 'package:flutter_application_7/core/constant/color.dart';

import 'package:get/get.dart'; // تأكد أنك مستورد GetX

void showLocationChoiceDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "اختر الموقع",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            const Text("هل تريد استخدام الموقع الحالي؟"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // إغلاق الحوار
                    Get.to(() => const MapScreen());
                  },
                  child: const Text(
                    "استخدام الموقع الحالي",
                    style: TextStyle(color: AppColor.pink, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // إغلاق الحوار
                    Get.to(() => AddAddressScreen());
                  },
                  child: const Text(
                    "إدخال يدوي",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
