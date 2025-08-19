import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/serveses/external_order_serveses.dart';

class ExternalOrderController extends GetxController {
  final ExternalOrderService externalOrderService = ExternalOrderService();

  Future<void> addExternalOrder({
    required String orderType,
    required String addressOption,
    required String manualOption,
    required String city,
    required String street,
    required int building,
    required int floor,
    required String notes,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("❌ المستخدم غير مسجل دخول");
      Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
      return;
    }

    final response = await externalOrderService.externalOrder(
      orderType,
      addressOption,
      manualOption,
      city,
      street,
      building,
      floor,
      notes,
      token,
    );

    if (response.containsKey('message')) {
      Get.snackbar("نجاح ✅", response['message'], snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("خطأ", "لم يتم تنفيذ الطلب");
    }
  }
}
