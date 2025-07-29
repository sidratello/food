import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/reservation_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ShowReservationController extends GetxController {
  final Api api = Api();

  List<ReservationModel> reservations = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void onInit() {
    getReservations();
    super.onInit();
  }

  Future<void> getReservations() async {
    try {
      errorMessage = null;
      isLoading = true;
      var response =
          await api.get(url: Applink.showreservation(), sendToken: true);
      List<ReservationModel> reservations = [];
      for (Map<String, dynamic> model in response) {
        ReservationModel reservationModel = ReservationModel.fromJson(model);
        reservations.add(reservationModel);
      }
      this.reservations = reservations;
    } catch (exception) {
      errorMessage = exception.toString();
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> cancelReservation(int id) async {
    try {
      errorMessage = null;
      isLoading = true;
      update();
      Map<String, dynamic> response = await api.post(
        url: Applink.cancelReservation(id),
        body: {},
        sendToken: true,
      );
      String message = response['message'] ?? "تم الغاء الحجز بنجاح";
      Get.snackbar(
        "نجاح",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on Exception catch (e) {
      Get.snackbar(
        "فشل الارسال",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
