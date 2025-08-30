import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class ExternalOrderExsistedAdressService {
  Future<Map<String, dynamic>> externalOrderexsistedadress(
    String orderType, // ✅ String بدل int
    String addressOption,
    String manualOption,
    int addressId,
    String token,

  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.addorder,
        body: {
          'order_type': orderType,
          'address_option': addressOption,
          'manual_option': manualOption,
       'address_id': addressId.toString(),
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
