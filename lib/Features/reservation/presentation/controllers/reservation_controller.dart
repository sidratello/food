import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/reservation_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  final Api api = Api();

  Future postReservations(String date, int guestsCount, String notes,
      String startTime) async {
    Map<String, dynamic> reservations = {
      'date': date,
      'guests_count': guestsCount,
      'notes': notes,
      'starttime': startTime,
    };

    try {
      Response response = await api.post(
        url: Applink.reservation(),
        body: reservations,
        sendToken: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // نجاح الطلب
        Get.snackbar(
          "نجاح",
          "تم إرسال الحجز بنجاح، في انتظار إشعار الموافقة",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // خطأ من السيرفر
        Get.snackbar(
          "خطأ",
          "حدث خطأ أثناء إرسال الحجز. الرجاء المحاولة لاحقًا.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      print("API Response: ${response.body}");
      return response;
    } catch (e) {
      Get.snackbar(
        "فشل الارسال",
        "تعذر الاتصال بالسيرفر. تحقق من الإنترنت وحاول مرة أخرى.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return e;
    }
  }
}
// class ReservationController extends GetxController {
//   final Api api = Api();
//
//   Future postReservations(String date, int guestsCount, String notes, String startTime ) async {
//
//     Map<String, dynamic> reservations = {
//       'date':date,
//       'guests_count':guestsCount,
//       'notes' : notes,
//       'starttime' :startTime,
//     // the rest
//     };
//     try {
//       Response response = await api.post(url: Applink.reservation(), body: reservations, sendToken: true, token: '');
//       print("API Response: ${response.body}");
//       return response;}
//     catch (e) {
//       Get.snackbar("فشل الارسال ",'');
//       return e;
//     }
//   }
//   }
