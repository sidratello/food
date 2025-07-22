import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';

class AddToCartService{

Future<Map<String, dynamic>>    addtocart(int product_id,String token,int quantity, String note)async{
try{
 Map<String, dynamic>  response=await Api().post(url:Applink.AddToCart,    body: <String, dynamic>{
     'product_id':product_id,
     'quantity':quantity,
'note':note,

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

