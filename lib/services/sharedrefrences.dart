import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServeses extends GetxService{
late SharedPreferences sharedPreferences;
Future<MyServeses>init()async{
sharedPreferences=await SharedPreferences.getInstance();


  return this;

}

}
initialServeses()async{

await Get.putAsync(() => MyServeses().init());
}




