import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_7/Features/mufaza/data/serveses/fill_the_mufaza.dart';

class AddToMuhfazaController extends GetxController {
  final FillTheMuhfazaService service = FillTheMuhfazaService();

  final isLoading = false.obs;
  final balance = 0.obs;

  Future<void> addToMuhfaza(String code) async {
    if (code.isEmpty) {
      Get.snackbar('تنبيه', 'الرجاء إدخال رمز الشحن');
      return;
    }

    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        Get.snackbar('خطأ', 'المستخدم غير مسجل دخول');
        return;
      }

      final res = await service.addToMuhfaza(token: token, code: code);

      final msg = (res['message'] ?? '').toString();
      final bal = res['balance'];

      if (msg.isNotEmpty) {
        // تحديث الرصيد إن وُجد
        if (bal != null) {
          balance.value = int.tryParse(bal.toString()) ?? balance.value;
        }

        Get.snackbar(
          'تمت العملية',
          bal == null ? msg : '$msg\nالرصيد الحالي: $bal',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.snackbar('فشل', 'لم تصل رسالة صحيحة من الخادم');
      }
    } catch (e) {
      Get.snackbar('خطأ', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
