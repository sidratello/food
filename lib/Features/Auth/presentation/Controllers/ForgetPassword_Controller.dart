


import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/data/ForgetPassword_servese.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomOtpDialog.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/VeryFayScreen.dart';
import 'package:flutter_application_7/screen/home.dart';





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
  
 
  } else {
    Get.snackbar("Error", "لم يتم إرسال الكود");
  }
}

  void showOtpSentDialog(int userId) {
  String phone = phone_Number.text.trim();


  // showDialog(
  //   context: Get.context!,
  //   builder: (context) => CustomOtpDialog(
  //     title: "OTP Sent",
  //     message: "An OTP has been sent to your WhatsApp....",
  //     buttonText: "Enter the OTP",
  //     imagePath: "assets/images/icons8-whatsapp-48.png",
  //     urlToLaunch: phone,
  //     nextScreen: VerifyCodeScreen(
  //       fromSignup: false,
  //       userId: userId,
  //     ),
  //   ),
  // );
  Get.dialog(CustomOtpDialog(
  title: 'OTP Sent',
  message: 'تم إرسال رمز التحقق إلى واتساب.',
  buttonText: 'أدخل الرمز',
  imagePath: 'assets/images/icons8-whatsapp-48.png',
  phoneIntl: phone, // تأكد أنه بصيغة دولية
  nextScreen: VerifyCodeScreen(fromSignup: false, userId: userId),
));

}




  

void onInit(){
phone_Number=TextEditingController();

super.onInit();
}

}