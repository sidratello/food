



import 'package:flutter_application_7/Features/Category/data/Serveses/delet_rating_serveses.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/show_rating_controller.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/Delet_from_favourite_serveses.dart';

import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/add_rating_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteRatingeController extends GetxController {
  final DeletRatServeses _deleteService = DeletRatServeses();

  Future<void> deleteFromrating(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("المستخدم غير مسجل دخول");
      return;
    }

    bool success = await _deleteService.deleetRat(productId, token);

    if (success) {
      print("🗑️ تم حذف ");

      if (Get.isRegistered<AddratingController>()){
        Get.find<Add_TO_Favourite_Controller>().favouriteProductIds.remove(productId);
      }

      if (Get.isRegistered<ShowratingController>()){
        Get.find<ShowratingController>().fetchrating();
      }
    } else {
      print("❌ فشل حذف المنتج من المفضلة");
    }
  }
}
