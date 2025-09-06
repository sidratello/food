
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
 var total = 0.obs; 
  var isClearing = false.obs; 

     var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }
   void fetchCart() async { //fetch the data from the server   
      try {
       isLoading.value = true;
       SharedPreferences prefs = await SharedPreferences.getInstance();
     String  token = prefs.getString('token') ?? '';

       CartResponseModel? result = await _showCart.show_cart(token); //  إرسال طلب إلى الباك and this return _showCart.show_cart(token); it return  CartList
           if (result != null) {
      CartList.assignAll(result.cartItems);     //this in model   final List<CartItemModel> cartItems;
        total.value = result.total; //result  بالمحتوى الموجود داخل  CartList استبدال كل محتوى القائمة 
      


}



     } catch (e) {
      print("خطأ أثناء جلب cart: $e");

    } finally {
      isLoading.value = false;
     }
   }


     void clearCart() {
    CartList.clear();
    total.value = 0;
  }

  Future<void> clearCartEverywhere() async {
    if (isClearing.value) return;
    isClearing.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      // احذف عنصر-عنصر من السيرفر
      final snapshot = List<CartItemModel>.from(CartList);
      for (final item in snapshot) {
        try {
          await _showCart.delete_item(token, item.productId);
        } catch (e) {
          print('delete item ${item.productId} failed: $e');
        }
      }

      // ثم فرّغ محليًا
      clearCart();
    } finally {
      isClearing.value = false;
    }




  }
}