import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/external_order.dart/data/model/show_adress_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class show_Adress_serveses{

     show_Adress(String token)async{

try{
var response = await Api().get(url:Applink.ShowAdress,token: token);
  print('🔎 GET ${Applink.ShowAdress} -> $response');


if (response is Map ){

    
        List<dynamic> adressJson = response['addresses'];
      List<AddressModel> addressesList = [];
for (int i = 0; i < adressJson.length; i++) {
  addressesList.add(AddressModel.fromJson(adressJson[i]));
}
return addressesList;

}
      if (response == null) {
        print('⚠️ لم يتم إيجاد مصفوفة عناوين في الرد.');
        return <AddressModel>[];
      }
}
catch (e) {
      // print('showAdress error: $e');
      return <AddressModel>[];
    }
}



}