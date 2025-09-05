
import 'package:flutter_application_7/Features/Category/data/Serveses/show_rating_serveses.dart';
import 'package:flutter_application_7/Features/Category/data/models/rating_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/ShowFavourite_servesses.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowratingController extends GetxController {


  final show_rating_serveses _showrate = show_rating_serveses();
 var ratingList = <ratingmodel>[].obs;
     var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchrating();
  }
   void fetchrating() async {
      try {
       isLoading.value = true;
       SharedPreferences prefs = await SharedPreferences.getInstance();
     String  token = prefs.getString('token') ?? '';

     var result = await _showrate.show_rating( token);
           if (result != null) {
        ratingList.assignAll(result); //result  بالمحتوى الموجود داخل  favouriteList استبدال كل محتوى القائمة 
      }
     } catch (e) {
      print("خطأ أثناء جلب التفييم: $e");

    } finally {
      isLoading.value = false;
     }
   }
  }
