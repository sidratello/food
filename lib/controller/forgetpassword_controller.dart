


import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/screen/varyfayscreen.dart';
import 'package:flutter_application_7/services/fofgetPassword.dart';
import 'package:flutter_application_7/services/login.dart';
import 'package:flutter_application_7/wedjet/sinup/CustomOtpDialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ForgetPasswordController extends GetxController{
send();

}
class ForgetPaswordControllerImp extends ForgetPasswordController {
 TextEditingController phone_Number = TextEditingController();


    final DataFogetPassword _dataForget = DataFogetPassword();



void send() async {
  String phone = phone_Number.text.trim();


  if (phone.isEmpty) {
    Get.snackbar("Error", "Phone and password cannot be empty");
    return;
  }

  var response = await _dataForget.getData(phone);

  if (response is Map && response.containsKey('userId')) {
    int userId = response['userId'];
 showOtpSentDialog(userId);
    // ✅ مرّر userId إلى شاشة التحقق
 
  } else {
    Get.snackbar("Error", "لم يتم إرسال الكود");
  }
}

  void showOtpSentDialog(int userId) {
  String phone = phone_Number.text.trim().replaceAll('+', '').replaceAll(' ', '');

  final String waUrl = "intent://send?phone=$phone#Intent;scheme=smsto;package=com.whatsapp;action=android.intent.action.SENDTO;end";

  showDialog(
    context: Get.context!,
    builder: (context) => CustomOtpDialog(
      title: "OTP Sent",
      message: "An OTP has been sent to your WhatsApp....",
      buttonText: "Enter the OTP",
      imagePath: "assets/images/icons8-whatsapp-48.png",
      urlToLaunch: waUrl,
      nextScreen: VerifyCodeScreen(
        fromSignup: false,
        userId: userId,
      ),
    ),
  );
}




  

void onInit(){
phone_Number=TextEditingController();

super.onInit();
}

}