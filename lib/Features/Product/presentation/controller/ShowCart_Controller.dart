
import 'package:flutter_application_7/Features/Product/data/model/Cart_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/ShowCart_servese.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/ShowFavourite_servesses.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowCartController extends GetxController {


  final show_Cart_serveses _showCart = show_Cart_serveses();
var CartList = <CartItemModel>[].obs;
var total = ''.obs;


     var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }
   void fetchCart() async { //fetch the data from the server   جلب بيانات السلة من السيرفر.
      try {
       isLoading.value = true;
       SharedPreferences prefs = await SharedPreferences.getInstance();
     String  token = prefs.getString('token') ?? '';

     var result = await _showCart.show_cart(token); //  إرسال طلب إلى الباك and this return _showCart.show_cart(token); it return  CartList
           if (result != null) {
        CartList.assignAll(result); //result  بالمحتوى الموجود داخل  CartList استبدال كل محتوى القائمة 
      

  // total.value = result['total'].toString();
  // List<CartItemModel> items = (result['cart'] as List)
  //     .map((item) => CartItemModel.fromJson(item))
  //     .toList();
  // CartList.assignAll(items);
}



     } catch (e) {
      print("خطأ أثناء جلب cart: $e");

    } finally {
      isLoading.value = false;
     }
   }
  }
