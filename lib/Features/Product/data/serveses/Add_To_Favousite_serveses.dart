import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class AddToFavouriteService{

Future<Map<String, dynamic>>    addtofavourite(int product_id,String token)async{
try{
 Map<String, dynamic>  response=await Api().post(url:Applink.AddtoFavourite,    body: <String, dynamic>{
     'product_id':product_id,
        }, token:token);

     if (response.containsKey("message")) {
        return response;
      } else {
        return {"message": "خطأ في السيرفر"};
      }
}
      catch (e) {
    print("⚠️ Error adding to favourite: $e");
    return {'message': 'حدث خطأ أثناء الإضافة'};
    }


 

}
}

