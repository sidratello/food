import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/data/login_service.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/UsertypeController.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/delivery_app/show_orders/presentation/views/show_orders_screen.dart';
import 'package:flutter_application_7/screen/home.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  login();

  gotoSignUp();
}

class LoginControllerImp extends LoginController {
  TextEditingController phone_Number = TextEditingController();
  TextEditingController password = TextEditingController();

  final Datalogin _datalogin = Datalogin();

  @override
  void login() async {
    String phone = phone_Number.text.trim();
    String pass = password.text.trim();

    if (phone.isEmpty || pass.isEmpty) {
      Get.snackbar("خطأ", "يرجى إدخال رقم الهاتف وكلمة المرور");
      return;
    }

    try {
      var response = await _datalogin.getData(phone, pass);

      if (response is Map && response.containsKey('access_token')) {
        // ✅ حفظ التوكن
        String token = response['access_token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        // ✅ جلب الدور من SharedPreferences
        String? role = prefs.getString('user_role');

        // ✅ توجيه حسب الدور
        if (role == 'driver') {
          Get.offAll(() => ShowOrdersScreen()); // شاشة عامل التوصيل
        } else if (role == 'user') {
          Get.offAll(() => HomePage()); // شاشة المستخدم العادي
        } else {
          Get.snackbar("خطأ", "لم يتم تحديد الدور");
        }
      } else if (response is Map && response.containsKey('message')) {
        String message = response['message'];
        Get.snackbar("فشل تسجيل الدخول", message);
      }
    } catch (e) {
      String errorMessage = e.toString().replaceFirst("Exception: ", "").trim();

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
  void gotoSignUp() {
    if (ChooseRoleControllerImp.role != null) {
      Get.to(() => Sinup(type: ChooseRoleControllerImp.role!));
    } else {
      Get.snackbar('خطأ', 'الرجاء اختيار الدور أولاً');
    }
  }

  @override
  void onInit() {
    phone_Number = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
