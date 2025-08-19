// lib/Features/show_reservation/data/services/show_reservation_service.dart
import 'package:flutter_application_7/Features/show_reservation/data/model/reservationmodel.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:flutter_application_7/helper/AppLink.dart';


class ShowReservationService {
  final Api _api = Api();

  /// تجلب قائمة الحجوزات من السيرفر
  Future<List<ReservationModel>> fetchReservations() async {
    final response = await _api.get(
      url: Applink.showreservation(),
      sendToken: true, // نستخدم التوكن المخزن
    );

    // المتوقع: response عبارة عن List<dynamic> من JSON
    final list = (response as List)
        .map((e) => ReservationModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return list;
  }
}
