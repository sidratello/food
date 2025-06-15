
import 'dart:convert';

import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as http;

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
      // إذا كان الكود ناجح (200 أو 201)
      if (response is http.Response && response.statusCode < 400) {
        return jsonDecode(response.body);
      }
      final responseBody = jsonDecode(response.body);
      // إذا فيه خطأ من السيرفر (زي 422)
     if (response.statusCode >= 400) {
        if (responseBody.containsKey("message")) {
          throw Exception(responseBody["message"]);
        } else if (responseBody.containsKey("error")) {
          throw Exception(responseBody["error"]);
        } else {
          throw Exception("Signup failed with unknown error");
        }
      }

      return responseBody;
    } catch (e) {
      print("❌ Error in signup API call: $e");
      throw Exception(e.toString());
    }
  }
  
}