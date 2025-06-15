import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class DataVarificationFirst {
  Future<dynamic> getData({
    required int userId,
    required String otpValue,
  }) async {
    try {
      var response = await Api().post(
        url: Applink.verifyCodeUrl(userId), // 👈 الآن userId معرف
        body: {
          'verification_code': otpValue,   // 👈 الآن otpValue معرف
        },
        token: '',
      );

      print("API Response: $response");
      return response;
    } catch (e) {
      print("Error in API call: $e");
      return e;
    }
  }
}