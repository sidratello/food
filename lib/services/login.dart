
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class Datalogin {




   Future<dynamic> getData(String phoneNumber, String password) async {
    try {
      var response = await Api().post(
        url: Applink.login,
        body: <String, String>{
         'mobile':phoneNumber,
         'password':password,
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