import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class AddRatingService {
  Future<Map<String, dynamic>> rate(
  int product_id,
  int rating,



String token
  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.rating,
        body: {
  'product_id': product_id,
'rating':rating,
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
      return {'message': ' we have error when we rating '};
    }
  }
}
