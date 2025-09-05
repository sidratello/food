import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/reservation_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  final Api api = Api();

  Future postReservations(
    String date,
    int guestsCount,
    String notes,
    String startTime,
    String endTime,
    bool isEdit,
      [int? reservationId]
      ) async {
    String requestLink = (isEdit && reservationId != null)
        ? Applink.updateReservation(reservationId)
        : Applink.reservation();
    Map<String, dynamic> reservations = {
      'date': date,
      'guests_count': guestsCount,
      'notes': notes,
      'starttime': startTime,
      'endtime': endTime,
    };

    try {
      Map<String, dynamic> response = await api.post(
        url: requestLink,
        body: reservations,
        sendToken: true,
      );
// نجاح الطلب
      Get.snackbar(
        "نجاح",
        "تم إرسال الحجز بنجاح، في انتظار إشعار الموافقة",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      print("API Response: ${response}");
      return response;
    } catch (e) {
      Get.snackbar(
        "فشل الارسال",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return e;
    }
  }
}
