

import 'package:flutter/material.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class DeletFromCartServeses {
  

    Future<bool>    deleetFromCartServeses(int product_id,String token)async{



 dynamic response= await Api().delete( url:Applink.DeletFromCart(product_id),token: token);

if(response is Map && response.containsKey("message")){
  Get.snackbar(
        "تم الحذف", 
        response["message"], 
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return true;
    }
     else {
      Get.snackbar(
        "فشل", 
        " لم يتم حذف المنتج من السلة", 
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return false;
    }

}}


