


import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/New_passwor_Screen.dart';
import 'package:flutter_application_7/screen/departmentscreen.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/services/VaryFication.dart';
import 'package:flutter_application_7/services/VeryFayFirst.dart';
import 'package:flutter_application_7/services/fofgetPassword.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class VaryFicationFirstController extends GetxController{
veryfay();

}
class VaryFicationFirstControllerImp extends VaryFicationFirstController {



 final DataVarificationFirst _dataVarificationFirst = DataVarificationFirst();



void veryfay() async {



void verifyOtp(int userId, String code) async {
  var response = await _dataVarificationFirst.getData(userId: userId, otpValue: code);

  if (response is Map && response['message'] == 'Verified successfully') {
    Get.snackbar("تم التحقق", "تم ارسال الرمز بنجاح");
    Get.to(HomePage());// Navigate to next screen
  } else {
    Get.snackbar("فشل الارسال ","");
  }
}


}


  



}