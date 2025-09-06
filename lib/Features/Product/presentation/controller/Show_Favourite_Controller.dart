
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/ShowFavourite_servesses.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ShowFavouriteController extends GetxController {
  final show_Favourite_product_serveses _showFav = show_Favourite_product_serveses();
  var favouriteList = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavourite();
  }

  void clearFavourites() => favouriteList.clear();

  Future<void> fetchFavourite() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();

      // If you store userId on login, use it to detect user switches.
      final currentUserId = prefs.getInt('userId'); // set this on login
      final lastFavsOwner = prefs.getInt('favs_owner');

      // No token? Treat as logged out → empty favorites.
      final token = prefs.getString('token') ?? '';
      if (token.isEmpty) {
        favouriteList.clear();
        return;
      }

      // If user changed, clear list first so UI doesn’t show the old user’s data.
      if (currentUserId != null && currentUserId != lastFavsOwner) {
        favouriteList.clear();
        await prefs.setInt('favs_owner', currentUserId);
      }

      final result = await _showFav.show_favourite_product(token);
      favouriteList.assignAll(result ?? []);
    } catch (e) {
      // If the token is invalid/expired (401), clear the list
      favouriteList.clear();
      print("خطأ أثناء جلب المفضلة: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
