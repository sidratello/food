import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_7/Features/Category/data/Serveses/update_name_serveses.dart';

class UpdatenameController extends GetxController {
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  final UpdatenameService _service = UpdatenameService();

  Future<void> submit() async {
  

    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
        return;
      }

      final resp = await _service.updatename(nameCtrl.text.trim(), token);

      if (resp.containsKey('message')) {
          if (Get.isRegistered<ShowProfileController>()) {
    await Get.find<ShowProfileController>().fetchProfile();
  }
        Get.snackbar("نجاح ✅", resp['message'], snackPosition: SnackPosition.BOTTOM);
        Get.back(); // ارجع للشاشة السابقة بعد النجاح (اختياري)
      } else {
        Get.snackbar("خطأ", "لم يتم تحديث الاسم");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    super.onClose();
  }
}
