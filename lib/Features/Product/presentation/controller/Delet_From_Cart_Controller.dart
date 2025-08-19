



import 'package:flutter_application_7/Features/Product/data/serveses/Delet_from_Cart_Serveses.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/Delet_from_favourite_serveses.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Cart_Controller.dart';

import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteCartController extends GetxController {
  final DeletFromCartServeses _deleteCartService = DeletFromCartServeses();

  Future<void> deleteFromCart(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("المستخدم غير مسجل دخول");
      return;
    }

    bool success = await _deleteCartService.deleetFromCartServeses(productId, token);

    if (success) {
      print("🗑️ تم حذف المنتج من السلة");

      if (Get.isRegistered<Add_TO_Cart_Controller>()) {
        Get.find<Add_TO_Cart_Controller>().CartProductIds.remove(productId);
      }

      if (Get.isRegistered<ShowCartController>()) {
        Get.find<ShowCartController>().fetchCart();
      }
    } else {
      print("❌ فشل حذف المنتج من المفضلة");
    }
  }
}
