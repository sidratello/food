import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Future<dynamic> get({
    required String url,
    String? token,
    bool sendToken = false,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    if (sendToken) {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? storedToken = sharedPreferences.getString('token');
      if (storedToken != null) {
        headers['Authorization'] = 'Bearer $storedToken';
      }
    } else if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('هناك مشكلة في ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
    bool sendToken = false,
   
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',    //i tell him to give me the data as json 
    };

    if (sendToken) {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? storedToken = sharedPreferences.getString('token');
      if (storedToken != null) {
        headers['Authorization'] = 'Bearer $storedToken';
      }
    } 
    
    else if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    print("📡 جاري إرسال الطلب إلى: $url");

    try {
   
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body), //when we send the data it should be as json so we put it in json so the server can red it 
        headers: headers,
      );
 

      print("✅ تم استلام الرد، الكود: ${response.statusCode}");   
   print("🧾 Body المرسل: $body");
      // final responseBody = jsonDecode(response.body);
      final responseBody = response.body.isNotEmpty
    ? jsonDecode(response.body)
    : {"message": "الرد كان فارغاً من السيرفر"};


      if (response.statusCode == 200 || response.statusCode == 201) {
        print("📊 بيانات الاستجابة: $responseBody");
        return responseBody;
      } else {
        final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
        throw Exception(errorMessage);
      }
    } catch (e) {
    //  هذا ما يحصل عند 401 أو 404
    String errorMessage = e.toString().replaceFirst("Exception: ", "").trim();//remove exception word from message

    if (errorMessage.contains("Incorrect password.")) {
      Get.snackbar("كلمة المرور خاطئة", "يرجى التحقق من كلمة المرور");
    } else if (errorMessage.contains("User not found")) {
      Get.snackbar("المستخدم غير موجود", " يرجى  انشاء حساب");
    } else {
      Get.snackbar("فشل", "حدث خطأ: $errorMessage");
    }

    print("❌ Login error: $errorMessage");
  }
  }





Future<dynamic> delete(
  // String Function(int product_id) deletFromFav,
   {
  required String url,
  String? token,
  bool sendToken = false,
}) async {
  Map<String, String> headers = {
    'Accept': 'application/json',
  };

  if (sendToken) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? storedToken = sharedPreferences.getString('token');
    if (storedToken != null) {
      headers['Authorization'] = 'Bearer $storedToken';
    }
  } else if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  try {
    print("🔴 إرسال طلب DELETE إلى: $url");

    final response = await http.delete(Uri.parse(url), headers: headers);

    print("🟢 تم استلام الرد، الكود: ${response.statusCode}");

    final responseBody = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : {"message": "الرد كان فارغاً من السيرفر"};

    if (response.statusCode == 200 || response.statusCode == 204) {
      return responseBody;
    } else {
      final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
      throw Exception(errorMessage);
    }
  } catch (e) {
    String errorMessage = e.toString().replaceFirst("Exception: ", "").trim();
    Get.snackbar("خطأ في الحذف", errorMessage);
    print("❌ Delete error: $errorMessage");
  }
}





}
