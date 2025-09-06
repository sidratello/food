


// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/NewPassword_Screen.dart';



// import 'package:flutter_application_7/services/VaryFication.dart';


// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class VaryFicationController extends GetxController{
// veryfay();

// }
// class VaryFicationControllerImp extends VaryFicationController {
//   final DataVarification _dataVarification = DataVarification();

//   @override
// void veryfay() async {
//     // لا داعي لها الآن، أو يمكن حذفها تمامًا
  

//   void verifyOtp(int userId, String code) async {
//     var response = await _dataVarification.getData(userId: userId, otpValue: code);

//     if (response is Map && response['message'] == 'Verified successfully.') {
//       Get.snackbar("تم التحقق", "تم التحقق من الرمز بنجاح");

//       String? token = response['access_token'];

//       if (token != null) {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('token', token);
//         print("✅ Token saved after OTP: $token");
//       } else {
//         print("⚠️ Token was null in OTP response");
//       }

//       Get.to(New_Password_Screen(userId: userId));
//     } else {
//       Get.snackbar("فشل التحقق", "الرمز غير صحيح أو منتهي الصلاحية");
//     }
//   }
//   }
// }
