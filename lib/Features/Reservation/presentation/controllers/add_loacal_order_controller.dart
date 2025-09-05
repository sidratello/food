




import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Reservation/data/serveses/add_local_order_serveses.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/show_mufaza.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/controller/show_order_controller.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Add_order_controller extends GetxController {
  
AddOrderServeses _addOrderServeses =new AddOrderServeses();

RxSet<int> OrderProductIds = <int>{}.obs; 


    @override
    void onInit() {

      loadorder();

         super.onInit(); 
    }

    Future<void> loadorder() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>?   orderIds = prefs.getStringList('order'); // there we get the favourite we store 
      if (orderIds != null) {
        OrderProductIds.addAll(orderIds.map(int.parse));//map go to each item and convert it to int and put it in favouriteProductIds
      
      }
    }

       Future<void>  Order(String ordertype,int idres)async{
  {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      print("❌ المستخدم غير مسجل دخول");
      return;
    }
var response=await _addOrderServeses.addorder(ordertype, idres,token);

      if (response is Map && response.containsKey('message')) {

          OrderProductIds.add(idres); 
        
        prefs.setStringList(  
          'order',
          OrderProductIds.map((e) => e.toString()).toList(), //store the favouriteProductIds
        );
    if (response.containsKey('message')) {
      Get.snackbar("نجاح ✅", response['message'], snackPosition: SnackPosition.BOTTOM);
final cartController = Get.find<ShowCartController>();
cartController.clearCart();
if (Get.isRegistered<ShowOrdersController>()) {
  await Get.find<ShowOrdersController>().fetchOrders();
}

      if (Get.isRegistered<ShowMufazaController>()) {
  await Get.find<ShowMufazaController>().fetchWallet();
}
    } else {
      Get.snackbar("خطأ", "لم يتم تنفيذ الطلب");
    }


            
      } else {
        print("❌ faild order ");
      }
    }
















}

}
























