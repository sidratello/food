


import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/services/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController{
login();
gotoSignUp();
}
class LoginControllerImp extends LoginController {
 TextEditingController phone_Number = TextEditingController();
  TextEditingController password = TextEditingController();

    final Datalogin _datalogin = Datalogin();



void login() async {
  String phone = phone_Number.text.trim();
  String pass = password.text.trim();

  if (phone.isEmpty || pass.isEmpty) {
    Get.snackbar("Error", "Phone and password cannot be empty");
    return;
  }

  var response = await _datalogin.getData(phone, pass);

 if (response is Map && response.containsKey('access_token')) {
    String token = response['access_token'];
    String username = response['user']['username'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    Get.to(HomePage());
  } else {
    // ✅ اطبع الخطأ إذا لم يكن Map
    print("Login failed. Response: $response");
    Get.snackbar("Login Failed", "Check your credentials");
  }
}

  
  @override
  gotoSignUp() {
    Get.to(Sinup());
  }
  

void onInit(){
phone_Number=TextEditingController();
password=TextEditingController();
super.onInit();
}

}








