import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class logoutService {
  Future<Map<String, dynamic>> logout(




String token
  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.logout,
        body: {},
        token: token,
      );

      if (response.containsKey("message")) {
        return response;
      } else {
        return {"message": "خطأ في السيرفر"};
      }
    } catch (e) {
      print("⚠️ Error : $e");
      return {'message': ' we have error when we logout '};
    }
  }
}
