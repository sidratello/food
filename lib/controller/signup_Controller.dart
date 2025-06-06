


import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/screen/varyfayscreen.dart';
import 'package:flutter_application_7/services/Signup.dart';
import 'package:flutter_application_7/wedjet/sinup/CustomOtpDialog.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignupController extends GetxController{
signup();
gotoSignin();
}
class SignupControllerImp extends SignupController {
   TextEditingController username = TextEditingController();
 TextEditingController phone_Number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
    final DataSignup _dataSignup = DataSignup();



       void showOtpSentDialog(int userId) {
          String phone = phone_Number.text.trim();
  showDialog(
    context: Get.context!,
    builder: (context) => CustomOtpDialog(
      title: "OTP Sent",
      message: "An OTP has been sent to your WhatsApp....",
      buttonText: "Enter the OTP",
      imagePath: "assets/images/icons8-whatsapp-48.png",
      urlToLaunch: "https://wa.me/$phone",
      nextScreen: VerifyCodeScreen(
        fromSignup: true,
        userId: userId,
      ),
    ),
  );
}

          

void signup() async {
  String phone = phone_Number.text.trim();
  String pass = password.text.trim();
  String name = username.text.trim();
  String loc = location.text.trim();

  if (phone.isEmpty || pass.isEmpty) {
    Get.snackbar("Error", "Phone and password cannot be empty");
    return;
  }

  var response = await _dataSignup.getData(name, phone, pass, loc);
 print("📡 RESPONSE RECEIVED: $response"); 
  if (response is Map && response.containsKey('userId')) {
      int userId = response['userId'];
    String? token = response['access_token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId.toString());
      if (token != null) {
      await prefs.setString('token', token);
    }

     showOtpSentDialog(userId);
  } else {
    Get.snackbar("Signup Failed", "Check your credentials");
    print("Signup failed. Response: $response");
  }
}


  
  @override
  gotoSignin() {
    Get.to(login());
  }
  

void onInit(){
phone_Number=TextEditingController();
password=TextEditingController();
username=TextEditingController();
location=TextEditingController();
super.onInit();
}



}