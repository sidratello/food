
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class DataRePassword {

  Future<dynamic> getData({
    required int userId,required
String password,
  }) async {
    try {
      var response = await Api().post(
        url: Applink.RePaswordUrl(userId), 
        body: {
          'new_password':password,  
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