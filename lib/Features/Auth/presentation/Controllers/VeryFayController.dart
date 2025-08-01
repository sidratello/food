



import 'package:flutter_application_7/Features/Auth/data/veryfay_serveses.dart';

import 'package:flutter_application_7/screen/home.dart';




import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class VaryFicationFirstController extends GetxController{
veryfay();

}
class VaryFicationFirstControllerImp extends VaryFicationFirstController {



 final DataVarificationFirst _dataVarificationFirst = DataVarificationFirst();



void veryfay() async {



void verifyOtp(int userId, String code) async {
  var response = await _dataVarificationFirst.getData(userId: userId, otpValue: code);

  if (response is Map && response['message'] == 'Verified successfully') {
    Get.snackbar("تم التحقق", "تم ارسال الرمز بنجاح");

    
    Get.to(HomePage());// Navigate to next screen
  } else {
    Get.snackbar("فشل الارسال ","");
  }
}


}


  



}