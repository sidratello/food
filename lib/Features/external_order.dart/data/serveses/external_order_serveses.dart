import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ExternalOrderService {
  Future<Map<String, dynamic>> externalOrder(
    String orderType, // ✅ String بدل int
    String addressOption,
    String manualOption,
    String city,
    String street,
    int building,
    int floor,
    String notes,
    String token,
  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.addorder,
        body: {
          'order_type': orderType,
          'address_option': addressOption,
          'manual_option': manualOption,
          'city': city,
          'street': street,
          'building': building.toString(),
          'Floor': floor.toString(),
          'notes': notes,
        },
        token: token,
      );

      if (response.containsKey("message")) {
        return response;
      } else {
        return {"message": "خطأ في السيرفر"};
      }
    } catch (e) {
      print("⚠️ Error : $e");
      return {'message': 'حدث خطأ أثناء الطلب'};
    }
  }
}
