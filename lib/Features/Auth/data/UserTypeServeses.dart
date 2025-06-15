
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class DataUserType {




   Future<dynamic> getData(String role) async {
    try {
      var response = await Api().post(
       url: Applink.choose,
        body: <String, String>{
       'role': role
       
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