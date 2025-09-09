


import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/data/login_service.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/views/homepage.dart';



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
  String phone = phone_Number.text.trim(); //delet the space in the text 
  String pass = password.text.trim();



  try {
    var response = await _datalogin.getData(phone, pass);

    if (response is Map && response.containsKey('access_token')) {
      String token = response['access_token'];
      

      final Map user      = response['user'];
      final int userId    = user['id']; 


      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response['access_token']);

     await prefs.setInt('user_id', userId);     
     
           // ✅ حفظ userId كـ int
           if (Get.isRegistered<Add_TO_Favourite_Controller>()) {
        await Get.find<Add_TO_Favourite_Controller>().reloadForNewUser();
      }
if (Get.isRegistered<ShowFavouriteController>()) {
  await Get.find<ShowFavouriteController>().onUserChanged();
}


      Get.to(HomePage());
    } 
    else if (response is Map && response.containsKey('message')) {

      String message = response['message'];
      Get.snackbar("فشل تسجيل الدخول", message);
    } 
  } catch (e) {
    //  هذا ما يحصل عند 401 أو 404
    String errorMessage = e.toString().replaceFirst("Exception: ", "").trim();//remove exception word from message

    if (errorMessage.contains("Incorrect password.")) {
      Get.snackbar("كلمة المرور خاطئة", "يرجى التحقق من كلمة المرور");
    } else if (errorMessage.contains("User not found")) {
      Get.snackbar("المستخدم غير موجود", "يرجى التحقق من رقم الهاتف");
    } else {
      Get.snackbar("فشل", "حدث خطأ: $errorMessage");
    }

    print("❌ Login error: $errorMessage");
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








