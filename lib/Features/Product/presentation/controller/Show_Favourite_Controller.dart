
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
   void fetchFavourite() async {
      try {
       isLoading.value = true;
       SharedPreferences prefs = await SharedPreferences.getInstance();
     String  token = prefs.getString('token') ?? '';

     var result = await _showFav.show_favourite_product( token);
           if (result != null) {
        favouriteList.assignAll(result); //result  بالمحتوى الموجود داخل  favouriteList استبدال كل محتوى القائمة 
      }
     } catch (e) {
      print("خطأ أثناء جلب المفضلة: $e");

    } finally {
      isLoading.value = false;
     }
   }
  }
