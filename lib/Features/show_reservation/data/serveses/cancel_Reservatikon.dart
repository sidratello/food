// lib/Features/show_reservation/data/services/cancel_reservation_service.dart
import 'package:flutter_application_7/helper/api.dart';
import 'package:flutter_application_7/helper/AppLink.dart';

class CancelReservationService {
  final Api _api = Api();

  Future<Map<String, dynamic>> cancelReservation(int id) async {
   
    final res = await _api.post(
      url: Applink.cancelReservation(id),
      body: {},
      sendToken: true,
    );
    return Map<String, dynamic>.from(res);
  }
}
