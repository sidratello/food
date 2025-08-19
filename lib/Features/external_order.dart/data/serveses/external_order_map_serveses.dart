import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ExternalOrderMapService {
  Future<Map<String, dynamic>> externalOrder(
    String orderType, // ✅ String بدل int
    String addressOption,

    double longitude,
    double latitude,
String token
  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.addorder,
        body: {
          'order_type': orderType,
          'address_option': addressOption,
     
'longitude':longitude,
'latitude':latitude,
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
