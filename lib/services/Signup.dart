
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class DataSignup {




   Future<dynamic> getData(String username,String phoneNumber, String password,String location) async {
    try {
      var response = await Api().post(
        url: Applink.Signup,
        body: <String, String>{
          'username':username,
         'mobile':phoneNumber,
         'password':password,
         'location':location,
        },
        token:'',
      );
    print("API Response: $response"); // طباعة الاستجابة الناجحة
    return response;
  } catch (e) {
    print("Error in API call: $e"); // طباعة الخطأ
    return e; // إرجاع الخطأ
  }
  }
}