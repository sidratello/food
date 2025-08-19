import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/external_order.dart/data/serveses/external_order_map_serveses.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/serveses/external_order_serveses.dart';

class ExternalOrderMapController extends GetxController {
  final ExternalOrderMapService externalOrdermapService = ExternalOrderMapService();
 final isSending = false.obs;
  Future<void> addExternalOrdermap({
    required String orderType,
    required String addressOption,
    required double longitude,
    required double latitude,

  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("❌ المستخدم غير مسجل دخول");
      Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
      return;
    }
    try {
    final response = await externalOrdermapService.externalOrder(
      orderType,
      addressOption,
longitude,
latitude,
      token,
    );
      final msg = response['message']?.toString() ?? "تم إنشاء الطلب بنجاح";
      Get.snackbar("نجاح ✅", msg,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);

      // (اختياري) ارجع للشاشة السابقة أو انتقل لشاشة الطلبات
      // Get.back();
      // Get.off(() => OrdersScreen());
    } catch (e) {
      final err = e.toString().replaceFirst("Exception: ", "");
      Get.snackbar("خطأ", err,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isSending.value = false;
    }
  }
}
