
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class DataRePassword {

  Future<dynamic> getData({
    required int userId,required
String password,
  }) async {
    try {
      var response = await Api().post(
        url: Applink.RePaswordUrl(userId), // 👈 الآن userId معرف
        body: {
          'new_password':password,   // 👈 الآن otpValue معرف
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