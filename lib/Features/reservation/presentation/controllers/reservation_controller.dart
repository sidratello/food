// Features/Reservation/presentation/controller/Reservation_Controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/controllers/show_reservation_controller.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/views/show_reservation_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_7/Features/Reservation/data/serveses/reservation_serveses.dart';


class Reservation_Controller extends GetxController {
  final ReservationService _service = ReservationService();

  final isLoading = false.obs;
  final availableSlots = <String>[].obs;

  /// ترجع true إذا تم الحجز بنجاح
  Future<bool> submit(
    String date,
    int guestsCount,
    String notes,
    String startTime,
    String endTime,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      Get.snackbar("تنبيه", "المستخدم غير مسجل دخول");
      return false;
    }

    // تحقق محلي: وقت البداية قبل النهاية
    if (startTime.compareTo(endTime) >= 0) {
      Get.snackbar("تنبيه", "وقت البداية يجب أن يكون قبل وقت النهاية");
      return false;
    }

    isLoading.value = true;
    availableSlots.clear();

    try {
      final res = await _service.AddReservation(
        date,
        guestsCount,
        notes,
        startTime,
        endTime,
        token,
      );

      isLoading.value = false;

      final msg = (res["message"] ?? "تم الحجز بنجاح").toString();
      Get.snackbar("تم", msg, backgroundColor: Colors.green, colorText: Colors.white);

      // 🔹 تحديث شاشة عرض الحجوزات إذا كانت مسجلة
      if (Get.isRegistered<ShowReservationController>()) {
        await Get.find<ShowReservationController>().getReservations();
      }

      // 🔹 الانتقال لشاشة عرض الحجوزات مباشرة
      Get.off(() => ShowReservationScreen());

      return true;
    } catch (e) {
      isLoading.value = false;

      final raw = e.toString().replaceFirst("Exception: ", "").trim();

      // استخراج الأوقات المتاحة إذا موجودة
      final slotsRegex = RegExp(r'(\d{2}:\d{2}\s*-\s*\d{2}:\d{2})');
      final matches = slotsRegex.allMatches(raw).map((m) => m.group(0)!).toList();

      if (matches.isNotEmpty) {
        availableSlots.assignAll(matches);
      }

      Get.snackbar("غير متاح", raw.isNotEmpty ? raw : "تعذّر إتمام الحجز",
          backgroundColor: Colors.red, colorText: Colors.white);

      return false;
    }
  }
}
