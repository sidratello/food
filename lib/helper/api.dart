

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class Api {

Future<dynamic> get({required String url, String? token})async{

Map<String, String> headers = {
  'Accept': 'application/json', //i tell him to give me the data as json 
  'Authorization': 'Bearer $token',
};
 http.Response response=await http.get(Uri.parse(url), headers: headers,);
if(response.statusCode==200){
  return jsonDecode(response.body); //jsondecode to translate the body from json that is string to object that is map or list 

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
     final responseBody = jsonDecode(response.body);
//     print("📊 محتوى الرد: $responseBody");

if (response.statusCode == 200 || response.statusCode == 201) {
  var data = jsonDecode(response.body);
  print("📊 بيانات الاستجابة: $data");
  return data;
} else {
       // ✅ نرمي الرسالة الواضحة للمستخدم
       final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
       throw Exception(errorMessage);
     }

  } catch (e) {
     print("❌ حدث خطأ أثناء الاتصال: $e");
     throw Exception("حدث خطأ أثناء الاتصال بالخادم: $e");
  }
}


// Future<dynamic>  get({required String url, String? token})async{
// Map<String, String> headers = {
//   'Accept': 'application/json',
//   'Authorization': 'Bearer $token',
// };

//     print('Headers sent: $headers');  //
// http.Response response=await http.get(Uri.parse(url),headers: headers);

// if(response.statusCode==200){
//   return jsonDecode(response.body);

// }
// else{
//   throw Exception(
//     'there is problem in ${response.statusCode}');
  
// }

// }






// Future<dynamic> post({
//   required String url,
//   required dynamic body,
//   required String? token,
// }) async {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };

//   if (token != null && token.isNotEmpty) {
//     headers['Authorization'] = 'Bearer $token';
//   }

//   print("📡 جاري إرسال الطلب إلى: $url");

//   try {
//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: jsonEncode(body),
//       headers: headers,
//     );

//     print("✅ تم استلام الرد، الكود: ${response.statusCode}");
//      final responseBody = jsonDecode(response.body);
// //     print("📊 محتوى الرد: $responseBody");

// if (response.statusCode == 200 || response.statusCode == 201) {
//   var data = jsonDecode(response.body);
//   print("📊 بيانات الاستجابة: $data");
//   return data;
// } else {
//        // ✅ نرمي الرسالة الواضحة للمستخدم
//        final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
//        throw Exception(errorMessage);
//      }

//   } catch (e) {
//      print("❌ حدث خطأ أثناء الاتصال: $e");
//      throw Exception("حدث خطأ أثناء الاتصال بالخادم: $e");
//   }
// }





// }




// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;

// class Api {
// Future<dynamic>  get({required String url})async{

// http.Response response=await http.get(Uri.parse(url));

// if(response.statusCode==200){
//   return jsonDecode(response.body);

// }
// else{
//   throw Exception(
//     'there is problem in ${response.statusCode}');
  
// }

// }
// Future<dynamic> post({
//   required String url,
//   required dynamic body,
//   required String? token,
// }) async {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//   };

//   if (token != null && token.isNotEmpty) {
//     headers['Authorization'] = 'Bearer $token';
//   }

//   print("📡 جاري إرسال الطلب إلى: $url");

//   try {
//     http.Response response = await http.post(
//       Uri.parse(url),
//       body: jsonEncode(body),
//       headers: headers,
//     );

//     print("✅ تم استلام الرد، الكود: ${response.statusCode}");

//     final responseBody = jsonDecode(response.body);
//     print("📊 محتوى الرد: $responseBody");

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return responseBody;
//     } else {
//       // ✅ نرمي الرسالة الواضحة للمستخدم
//       final errorMessage = responseBody["message"] ?? "حدث خطأ غير متوقع";
//       throw Exception(errorMessage);
//     }
//   } catch (e) {
//     print("❌ حدث خطأ أثناء الاتصال: $e");
//     throw Exception("حدث خطأ أثناء الاتصال بالخادم: $e");
//   }
// }





 }