
import 'package:flutter_application_7/Features/Auth/data/UserTypeServeses.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ChooseRoleController extends GetxController {
  void selectRole(String role);
}

class ChooseRoleControllerImp extends ChooseRoleController {
  static String? role; // الدور المختار

  final DataUserType _service = DataUserType();

  @override
  void selectRole(String role) async {
    var response = await _service.getData(role);

    if (response is Map && response.containsKey('session_token')) {
      String sessionToken = response['session_token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('session_token', sessionToken);
      await prefs.setString('user_role', role);

      ChooseRoleControllerImp.role = role; // خزّن الدور

      print("Session Token Saved: $sessionToken");

      // انتقال حسب الدور
      if (role == 'user') {
        Get.to(() => login(type: "user"));
      } else if (role == 'driver') {
        Get.to(() => login(type: "driver"));
      }

      Get.snackbar('نجاح', 'تم اختيار الدور بنجاح');
    } else {
      Get.snackbar('خطأ', 'حدث خطأ في اختيار الدور');
    }
  }
}

