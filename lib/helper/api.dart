

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Api {
Future<dynamic>  get({required String url})async{

http.Response response=await http.get(Uri.parse(url));

if(response.statusCode==200){
  return jsonDecode(response.body);

}
else{
  throw Exception(
    'there is problem in ${response.statusCode}');
  
}

}

Future<dynamic> post({
  required String url,
  required dynamic body,
  required String? token,
}) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  if (token != null && token.isNotEmpty) {
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

if (response.statusCode == 200 || response.statusCode == 201) {
  var data = jsonDecode(response.body);
  print("📊 بيانات الاستجابة: $data");
  return data;
} else {
  print("⚠️ رسالة الخطأ: ${response.body}"); // ✅ اطبع محتوى الخطأ
  throw Exception("! خطأ في الطلب: ${response.statusCode}");
}

  } catch (e) {
    print("❌ حدث خطأ أثناء الاتصال: $e");
    return e;
  }
}





}