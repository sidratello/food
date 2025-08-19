import 'package:flutter_application_7/Features/Product/data/model/Cart_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_Cart_serveses{

      Future<CartResponseModel?> show_cart(String token)async{


var response = await Api().get(url:Applink.ShowCart,token: token); //response is map or list 


if (response is Map ){

  



return CartResponseModel.fromJson(Map<String, dynamic>.from(response)); //convert the responce from map to object of CartResponseModel


}
  return null;
}



}




