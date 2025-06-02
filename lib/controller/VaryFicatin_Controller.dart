


import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/New_passwor_Screen.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/services/VaryFication.dart';
import 'package:flutter_application_7/services/fofgetPassword.dart';
import 'package:flutter_application_7/services/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class VaryFicationController extends GetxController{
veryfay();

}
class VaryFicationControllerImp extends VaryFicationController {
 late int userId;
  late bool fromSignup;


 final DataVarification _dataVarification = DataVarification();



void veryfay() async {



void verifyOtp(int userId, String code) async {
  var response = await _dataVarification.getData(userId: userId, otpValue: code);

  if (response is Map && response['message'] == 'Verified successfully.') {
    Get.snackbar("تم التحقق", "تم التحقق من الرمز بنجاح");
    Get.to(New_Password_Screen(userId:userId,));// Navigate to next screen
  } else {
    Get.snackbar("فشل التحقق", "الرمز غير صحيح أو منتهي الصلاحية");
  }
}


}


  



}