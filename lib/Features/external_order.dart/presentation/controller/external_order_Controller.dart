import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/show_adresess_controller.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/show_mufaza.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/controller/show_order_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/serveses/external_order_serveses.dart';

class ExternalOrderController extends GetxController {
  final ExternalOrderService externalOrderService = ExternalOrderService();

   Future<bool> addExternalOrder({
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
      Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
      return false;
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

      final cartController = Get.find<ShowCartController>();
 await cartController.clearCartEverywhere(); 
      // (اختياري) حدّث قائمة العناوين فوراً لو كانت موجودة
      if (Get.isRegistered<ShowAddressController>()) {
        Get.find<ShowAddressController>().fetchAddresses();
      }
      if (Get.isRegistered<ShowOrdersController>()) {
  await Get.find<ShowOrdersController>().fetchOrders();
}
      if (Get.isRegistered<ShowMufazaController>()) {
  await Get.find<ShowMufazaController>().fetchWallet();
}


      return true;
    

    } else {
      Get.snackbar("خطأ", "لم يتم تنفيذ الطلب");
         return false;
    }
  }
}
