import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:flutter_application_7/Features/Category/data/Serveses/logout_serveses.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class logoutController extends GetxController {

  final isLoading = false.obs;

  final logoutService _service = logoutService();

  Future<void> submit() async {
  

    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
        return;
      }

      final resp = await _service.logout( token);
 await prefs.remove('token');



// يمسح token + role
  // تخلّص من الكونترولرات المرتبطة بالمستخدم
  if (Get.isRegistered<ShowFavouriteController>()) {
    Get.delete<ShowFavouriteController>(force: true);
  }
  if (Get.isRegistered<Add_TO_Favourite_Controller>()) {
    Get.delete<Add_TO_Favourite_Controller>(force: true);
  }
  if (Get.isRegistered<ShowCartController>()) {
    Get.delete<ShowCartController>(force: true);
  }



      if (resp.containsKey('message')) {

        Get.snackbar("تم ✅", resp['message'], snackPosition: SnackPosition.BOTTOM);
             Future.delayed(const Duration(seconds: 1), () {
        // استخدم واحدة من الطريقتين
        SystemNavigator.pop(); // الطريقة الأفضل
        // exit(0); // بديل على Android
      });
     // ارجع للشاشة السابقة بعد النجاح (اختياري)
      } else {
        Get.snackbar("خطأ", "لم يتم تسجيل الخروج");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
    } finally {
      isLoading.value = false;
    }
  }


}
