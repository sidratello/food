// lib/Features/show_reservation/presentation/controllers/cancel_reservation_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/show_reservation/data/serveses/cancel_Reservatikon.dart';
import 'package:get/get.dart';

import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/show_reservation_controller.dart';

class CancelReservationController extends GetxController {
  final CancelReservationService _service = CancelReservationService();
  final isLoading = false.obs;

  Future<void> cancel(int id) async {
    try {
      isLoading.value = true;

      final res = await _service.cancelReservation(id);
      final msg = (res['message'] ?? "تم إلغاء الحجز بنجاح").toString();

      Get.snackbar("تم", msg,
          backgroundColor: Colors.green, colorText: Colors.white);

      // حدّث قائمة الحجوزات لو الكنترولر مسجّل
      if (Get.isRegistered<ShowReservationController>()) {
        await Get.find<ShowReservationController>().getReservations();
      }
    } catch (e) {
      final raw = e.toString().replaceFirst("Exception: ", "").trim();
      Get.snackbar("خطأ", raw.isEmpty ? "تعذّر إلغاء الحجز" : raw,
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
