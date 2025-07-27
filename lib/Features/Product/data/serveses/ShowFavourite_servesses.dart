import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_Favourite_product_serveses{

     show_favourite_product(String token)async{


var response = await Api().get(url:Applink.ShowFavourit,token: token);


if (response is Map ){

    
        List<dynamic> FavouriteJson = response['favourite'];
      List<ProductModel> FavouriteList = [];
for (int i = 0; i < FavouriteJson.length; i++) {
  FavouriteList.add(ProductModel.fromJson(FavouriteJson[i]));
}
return FavouriteList;

}

}



}