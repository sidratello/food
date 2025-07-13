

import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class SearchForCategory {

Future<dynamic>    searchaboutCategory(String keyword,String token)async{

try{
var response  =await  Api().post(
  url:Applink.searchforproductandcategory,
    body: <String, String>{
       'keyword':keyword,
        },
 token: token );
 return response;
}

   catch (e) {
    print("Error in API call: $e"); // طباعة الخطأ
    return e; // إرجاع الخطأ
  }
}


}







