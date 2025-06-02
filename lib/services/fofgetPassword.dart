
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class DataFogetPassword {




   Future<dynamic> getData(String phoneNumber) async {
    try {
      var response = await Api().post(
        url: Applink.ForgetPassword,
        body: <String, String>{
         'mobile':phoneNumber,
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