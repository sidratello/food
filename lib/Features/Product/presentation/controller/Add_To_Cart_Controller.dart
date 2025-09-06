
import 'dart:ui';
import 'package:flutter_application_7/Features/Product/data/serveses/Add_To_Cart_serveses.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/Add_To_Favousite_serveses.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add_TO_Cart_Controller extends GetxController {

AddToCartService addToCartService=AddToCartService();




RxSet<int> CartProductIds = <int>{}.obs; //like the set that doesnt  لا تسمح بالتكرار (كل عنصر يظهر مرة واحدة فقط).

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>?   CartIds = prefs.getStringList('cart'); // there we get the favourite we store 
    if (CartIds != null) {
      CartProductIds.addAll(CartIds.map(int.parse));//map go to each item and convert it to int and put it in favouriteProductIds
    
    }
  }

  Future<void> toggleCart(int productId,int quantity, String note)async 
{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  if (token.isEmpty) {
    print(" المستخدم غير مسجل دخول");
    return;
  }
 var response=await addToCartService.addtocart(productId, token, quantity, note);
    
    if (response is Map && response.containsKey('message')) {

        CartProductIds.add(productId); 
      
      prefs.setStringList(  
        'cart',
        CartProductIds.map((e) => e.toString()).toList(), //store the favouriteProductIds
      );

  //  تحديث شاشة السلة بعد الإضافة
if (Get.isRegistered<ShowCartController>()) {
  final showCartController = Get.find<ShowCartController>();
  showCartController.fetchCart();
}

    Get.snackbar(
      "تمت الإضافة",
      "تم إضافة المنتج إلى السلة بنجاح",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(255, 240, 115, 142),
      colorText: Color.fromARGB(255, 43, 1, 10),
      duration: const Duration(seconds: 2),
    );


           
    } else {
      print(" فشل في تحديث cart");
    }
  }






}