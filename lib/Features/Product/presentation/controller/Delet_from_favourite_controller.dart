



import 'package:flutter_application_7/Features/Product/data/serveses/Delet_from_favourite_serveses.dart';

import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteFavouriteController extends GetxController {
  final DeletFavServeses _deleteService = DeletFavServeses();

  Future<void> deleteFromFavourite(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("المستخدم غير مسجل دخول");
      return;
    }

    bool success = await _deleteService.deleetFAV(productId, token);

    if (success) {
      print("🗑️ تم حذف المنتج من المفضلة");

      if (Get.isRegistered<Add_TO_Favourite_Controller>()) {
        Get.find<Add_TO_Favourite_Controller>().favouriteProductIds.remove(productId);
      }

      if (Get.isRegistered<ShowFavouriteController>()) {
        Get.find<ShowFavouriteController>().fetchFavourite();
      }
    } else {
      print("❌ فشل حذف المنتج من المفضلة");
    }
  }
}
