import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/external_order.dart/data/serveses/external_order_for_exsisted_adress_serveses.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/controller/show_adresess_controller.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/show_mufaza.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/controller/show_order_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/serveses/external_order_serveses.dart';

class ExternalOrderExsistedAdressController extends GetxController {
  final ExternalOrderExsistedAdressService externalOrderadressService = ExternalOrderExsistedAdressService();

   Future<bool> addExternalOrderforExsistedAdress({
    required String orderType,
    required String addressOption,
    required String manualOption,
required int addressId,

  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
      return false;
    }

    final response = await externalOrderadressService.externalOrderexsistedadress(orderType, addressOption, manualOption, addressId,token);

  final String msg = (response['message'] ?? '').toString();

    // ✅ نجاح حقيقي فقط عندما تكون الرسالة بالضبط كما يلي
    if (msg == 'تم إرسال الإشعار لعامل التوصيل') {
      Get.snackbar("نجاح ✅", msg, snackPosition: SnackPosition.BOTTOM);
    final cartController = Get.find<ShowCartController>();
 await cartController.clearCartEverywhere(); 
      if (Get.isRegistered<ShowCartController>()) {
        await Get.find<ShowCartController>().clearCartEverywhere();
      }
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
    }

    // ⚠️ أي رسالة أخرى من السيرفر نعرضها كما هي (بدون إجراءات نجاح)
    if (msg.isNotEmpty) {
      Get.snackbar("تنبيه", msg, snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("خطأ", "استجابة غير متوقعة من الخادم",
          snackPosition: SnackPosition.BOTTOM);
    }
    return false;
  
  }
}
