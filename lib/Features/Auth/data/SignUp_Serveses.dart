




import 'dart:convert';

import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as http;

class DataSignup {




   Future<dynamic> getData(String username, String phoneNumber, String password, String location, String sessionToken) async {
  try {
    var response = await Api().post(
      url: Applink.Signup,
      body: {
        'username': username,
        'mobile': phoneNumber,
        'password': password,
        'location': location,
        'session_token': sessionToken,
      },
      token: '',
    );

 
    if (response is Map<String, dynamic>) {
      if (response.containsKey("userId")) {
        return response;
      } else if (response.containsKey("message") || response.containsKey("errors")) {
        throw Exception(response["message"] ?? response["errors"]); // ?? if the message is existe it use it no it use errror 
      } else {
        throw Exception("Signup failed with unknown error");
      }
    }


      // return jsonDecode(response.body);

  } catch (e) {
    print("❌ Error in signup API call: $e");
    throw Exception(e.toString());
  }
}

}