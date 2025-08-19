// lib/Features/show_reservation/presentation/controllers/show_reservation_controller.dart
import 'package:flutter_application_7/Features/show_reservation/data/model/reservationmodel.dart';
import 'package:flutter_application_7/Features/show_reservation/data/serveses/show_reservaton_serveses.dart';
import 'package:get/get.dart';


class ShowReservationController extends GetxController {
  final ShowReservationService _service = ShowReservationService();

  // الحالة
  final reservations = <ReservationModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    getReservations();
  }

  /// جلب الحجوزات وتحديث الحالة
  Future<void> getReservations() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final data = await _service.fetchReservations();
      reservations.assignAll(data);
     
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


}
