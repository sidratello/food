




import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_7/Features/show_reservation/data/serveses/add_order_servese.dart';
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



      Get.snackbar(
        "تمت الإضافة",
        "تم إنشاء الطلب بنجاح",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 240, 115, 142),
        colorText: Color.fromARGB(255, 43, 1, 10),
        duration: const Duration(seconds: 2),
      );


            
      } else {
        print("❌ faild order ");
      }
    }
















}

}
























