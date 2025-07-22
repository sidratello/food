import 'package:flutter_application_7/Features/Product/data/model/Cart_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_Cart_serveses{

     show_cart(String token)async{


var response = await Api().get(url:Applink.ShowCart,token: token); //response is map or list 


if (response is Map ){

    
        List<dynamic> CartJson = response['cart'];//response['cart']; is a list "cart": [] in map {"cart": [], "total": 1723000}
                                                  //i want to translate each item in cart that is list and have map to object of CartItemModel so i can use it 

List<CartItemModel> CartList = [];
for (int i = 0; i < CartJson.length; i++) {
  CartList.add(CartItemModel.fromJson(CartJson[i]));
}
return CartList;

}

}



}