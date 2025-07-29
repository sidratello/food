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

    print("📡 جاري إرسال الطلب إلى: $url");

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );

      print("✅ تم استلام الرد، الكود: ${response.statusCode}");

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("📊 بيانات الاستجابة: $responseBody");
        return responseBody;
      } else {
        final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
        throw Exception(errorMessage);
      }
    } catch (e) {
      print("❌ حدث خطأ أثناء الاتصال: $e");
      throw Exception("حدث خطأ أثناء الاتصال بالخادم: $e");
    }
  }
}
