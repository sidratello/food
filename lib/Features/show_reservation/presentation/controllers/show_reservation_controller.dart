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
      List<dynamic> response = await api.get(url: Applink.showreservation(), sendToken: true);
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

  // Future<ReservationModel> getReservationItem() async {
  //   Map<String, dynamic> response = await api.get(url: Applink.showreservationItem(), sendToken: true);
  //   ReservationModel reservationItem = ReservationModel.fromJson(response);
  //   return reservationItem;
  // }
}
