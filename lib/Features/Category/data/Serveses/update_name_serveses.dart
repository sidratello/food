import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class UpdatenameService {
  Future<Map<String, dynamic>> updatename(
    String username,



String token
  ) async {
    try {
      Map<String, dynamic> response = await Api().post(
        url: Applink.updateProfile,
        body: {
          'username': username,

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
      return {'message': ' we have error when we update name '};
    }
  }
}
