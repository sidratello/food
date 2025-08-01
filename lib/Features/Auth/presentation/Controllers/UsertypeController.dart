
import 'package:flutter_application_7/Features/Auth/data/UserTypeServeses.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChooseRoleController extends GetxController {
  void selectRole(String role);
}

class ChooseRoleControllerImp extends ChooseRoleController {
  final DataUserType _service = DataUserType();

  @override
  void selectRole(String role) async {
    var response = await _service.getData(role);

    if (response is Map && response.containsKey('session_token')) {
      String sessionToken = response['session_token'];

    
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('session_token', sessionToken);

      await prefs.setString('user_role', role); // حفظ الدور


      print("🔐 Session Token Saved: $sessionToken");
     
      if (role == 'user') {
        Get.toNamed('/login');
      } else if (role == 'driver') {
        Get.toNamed('/loginDriver'); 
      }
      Get.snackbar('نجاح', 'تم اختيار الدور بنجاح');
    } else {
      Get.snackbar('خطأ', 'حدث خطأ في اختيار الدور');
    }
  }
}

