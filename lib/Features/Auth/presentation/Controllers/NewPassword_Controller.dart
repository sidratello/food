


import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/scsufful_page.dart';

import 'package:flutter_application_7/services/RePassword.dart';

import 'package:get/get.dart';



abstract class RePasswordController extends GetxController{
submit();

}
class RePasswordControllerImp extends RePasswordController {
    int userId;

  RePasswordControllerImp( {required this.userId});
  TextEditingController password = TextEditingController();


  final DataRePassword _dataRePassword = DataRePassword();

  Future<void> submit() async {
    String newPassword = password.text.trim();

    if (newPassword.isEmpty || newPassword.length < 8) {
      Get.snackbar("خطأ", "كلمة المرور يجب أن تكون 8 أحرف على الأقل");
      return;
    }

    var response = await _dataRePassword.getData(
      userId: userId,
      password: newPassword,
    );

    if (response is Map && response['message'] == 'Password reset successful.') {
      Get.snackbar("تم", "تم إعادة تعيين كلمة المرور بنجاح");
 Get.to(PasswordChangedSuccessScreen);
    } else {
      Get.snackbar("فشل", "حدث خطأ أثناء إعادة تعيين كلمة المرور");
      print("Response: $response");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
