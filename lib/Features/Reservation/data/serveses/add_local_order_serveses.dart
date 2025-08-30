import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class AddOrderServeses{


addorder(String ordertype,int idres,String token)async{
  

    Map<String, dynamic>  response= await Api().post(url: Applink.addorder,
      body: <String,dynamic>{
'order_type':ordertype,
'reservation_id':idres, },
token: token);

  if (response.containsKey("message")) {
         return response;
       } 
else {
         return {"message": "خطأ في الطلب"};
       }

}

}





