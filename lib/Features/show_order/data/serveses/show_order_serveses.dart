import 'package:flutter_application_7/Features/Product/data/model/Cart_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/show_order/data/model/show_order_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_Order_serveses{

  Future<List<OrderModel>>  show_order(String token)async{


var response = await Api().get(url:Applink.ShowOrder,token: token); //response is map or list 

    if (response is Map<String, dynamic>) {
      final list = (response['orders'] as List? ?? [])
          .map((e) => OrderModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return list; 
    }
    if (response['message'] != null) {
        throw response['message'].toString(); // ← خلّي الكنترولر يعرضها
      }
    return <OrderModel>[];
}




}




