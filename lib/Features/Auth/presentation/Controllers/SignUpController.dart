


// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Auth/data/SignUp_Serveses.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomOtpDialog.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/VeryFayScreen.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
// import 'package:flutter_application_7/screen/home.dart';


// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class SignupController extends GetxController{
// signup();
// gotoSignin();
// }
// class SignupControllerImp extends SignupController {
//    TextEditingController username = TextEditingController();
//  TextEditingController phone_Number = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController location = TextEditingController();
//     final DataSignup _dataSignup = DataSignup();



//        void showOtpSentDialog(int userId) {
//           String phone = phone_Number.text.trim();
//   showDialog(
//     context: Get.context!,
//     builder: (context) => CustomOtpDialog(
//       title: "OTP Sent",
//       message: "An OTP has been sent to your WhatsApp....",
//       buttonText: "Enter the OTP",
//       imagePath: "assets/images/icons8-whatsapp-48.png",
//       urlToLaunch: "https://wa.me/$phone",
//       nextScreen: VerifyCodeScreen(
//         fromSignup: true,
//         userId: userId,
//       ),
//     ),
//   );
// }

          

// void signup() async {
//   String phone = phone_Number.text.trim();
//   String pass = password.text.trim();
//   String name = username.text.trim();
//   String loc = location.text.trim();

//   if (phone.isEmpty || pass.isEmpty) {
//     Get.snackbar("Error", "Phone and password cannot be empty");
//     return;
//   }
// try{
//   var response = await _dataSignup.getData(name, phone, pass, loc);
//  print("📡 RESPONSE RECEIVED: $response"); 
//   if (response is Map && response.containsKey('userId')) {
//       int userId = response['userId'];
//     String? token = response['access_token'];
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('userId', userId.toString());
//       if (token != null) {
//       await prefs.setString('token', token);
//     }

//      showOtpSentDialog(userId);
//   } 
//   }
// catch (e) {
//   print("❌ Error in signup API call: $e");
//   if (e.toString().contains("The mobile has already been taken")) {
//     Get.snackbar("تنبيه", "لقد سجلت من قبل باستخدام هذا الرقم");
//   } else {
//     Get.snackbar("فشل التسجيل", e.toString());
//   }
// }




// }


  
//   @override
//   gotoSignin() {
//     Get.to(login());
//   }
  

// void onInit(){
// phone_Number=TextEditingController();
// password=TextEditingController();
// username=TextEditingController();
// location=TextEditingController();
// super.onInit();
// }



// }




// File: SignUpController.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/data/SignUp_Serveses.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/UsertypeController.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomOtpDialog.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/VeryFayScreen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignupController extends GetxController {
  signup();
  gotoSignin();
}
class SignupControllerImp extends SignupController {
  TextEditingController username = TextEditingController();
  TextEditingController phone_Number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  final DataSignup _dataSignup = DataSignup();

  void showOtpSentDialog(int userId, String token) {
    String phone = phone_Number.text.trim();
print("📞 phone text: ${phone_Number.text}");
print("📲 cleaned phone: ${phone_Number.text.trim()}");

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

  @override
  void signup() async {
    String phone = phone_Number.text.trim();
    String pass = password.text.trim();
    String name = username.text.trim();
    String loc = location.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sessionToken = prefs.getString('session_token');

    if (sessionToken == null || sessionToken.isEmpty) {
      Get.snackbar("خطأ", "Session token مفقود");
      return;
    }

    if (phone.isEmpty || pass.isEmpty) {
      Get.snackbar("خطأ", "رقم الهاتف وكلمة المرور مطلوبة");
      return;
    }

    try {
      var response = await _dataSignup.getData(name, phone, pass, loc, sessionToken);








      if (response is Map && response.containsKey('userId')) {

        int userId = response['userId'];
        String? token = response['access_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
        print("🧾 userId: ${response['userId']}");
  print("🔑 access_token: ${response['access_token']}");


        if (token != null) {
          await prefs.setString('token', token); // نحفظ التوكن مباشرة هنا
        }

        showOtpSentDialog(userId, token ?? "");
      }
    } catch (e) {
      if (e.toString().contains("The mobile has already been taken")) {
        Get.snackbar("تنبيه", "لقد سجلت من قبل باستخدام هذا الرقم");
      } else {
        Get.snackbar("فشل التسجيل", e.toString());
      }
    }
  }

  @override
  void gotoSignin() {
    if (ChooseRoleControllerImp.role != null) {
      Get.to(() => login(type: ChooseRoleControllerImp.role!));
    } else {
      Get.snackbar('خطأ', 'الرجاء اختيار الدور أولاً');
    }
  }


  @override
  void onInit() {
    phone_Number = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    location = TextEditingController();
    super.onInit();
  }
}
