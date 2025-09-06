import 'package:flutter_application_7/Features/Category/data/models/rating_model.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_rating_serveses{

     show_rating(String token)async{


var response = await Api().get(url:Applink.showrating,token: token);


if (response is Map ){

    
        List<dynamic> ratingJson = response['data'];
      List<ratingmodel> ratingList = [];
for (int i = 0; i < ratingJson.length; i++) {
  ratingList.add(ratingmodel.fromJson(ratingJson[i]));
}
return ratingList;

}

}



}