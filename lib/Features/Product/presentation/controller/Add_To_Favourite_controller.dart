



import 'package:flutter_application_7/Features/Product/data/serveses/Add_To_Favousite_serveses.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Delet_from_favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add_TO_Favourite_Controller extends GetxController {

AddToFavouriteService addToFavouriteService=AddToFavouriteService();




RxSet<int> favouriteProductIds = <int>{}.obs; //like the set that doesnt  لا تسمح بالتكرار (كل عنصر يظهر مرة واحدة فقط).

  @override
  void onInit() {
    super.onInit();
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favIds = prefs.getStringList('favourites'); // there we get the favourite we store 
    if (favIds != null) {
      favouriteProductIds.addAll(favIds.map(int.parse));//map go to each item and convert it to int and put it in favouriteProductIds
    
    }
  }
Future<void> toggleFavourite(int productId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  if (token.isEmpty) {
    print("المستخدم غير مسجل دخول");
    return;
  }

  // حذف أو إضافة حسب الحالة
  if (isFavourite(productId)) {
    // حذف
    favouriteProductIds.remove(productId);
    await Get.put(DeleteFavouriteController()).deleteFromFavourite(productId);
  } else {
    // إضافة
    final response = await addToFavouriteService.addtofavourite(productId, token);
    if (response is Map && response.containsKey('message')) {
      favouriteProductIds.add(productId);
    } else {
      print("❌ فشل في إضافة المنتج إلى المفضلة");
    }
  }

  // تحديث التخزين المحلي
  prefs.setStringList(
    'favourites',
    favouriteProductIds.map((e) => e.toString()).toList(),
  );

  if (Get.isRegistered<ShowFavouriteController>()) {
    Get.find<ShowFavouriteController>().fetchFavourite();
  }

  print("✅ حالة المفضلة: $favouriteProductIds");
}




bool isFavourite(int productId) {
  return favouriteProductIds.value.contains(productId);
}


}