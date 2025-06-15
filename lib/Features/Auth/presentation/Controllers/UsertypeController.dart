
import 'package:flutter_application_7/Features/Auth/data/UserTypeServeses.dart';
import 'package:get/get.dart';

abstract class ChooseRoleController extends GetxController {
  void selectRole(String role);
}

class ChooseRoleControllerImp extends ChooseRoleController {
  final DataUserType _service = DataUserType();

  @override
  void selectRole(String role) async {
    var response = await _service.getData(role);

    if (response is Map && response.containsKey('session_token')) {
      // عملية اختيار الدور ناجحة
      if (role == 'user') {
        Get.toNamed('/login'); // شاشة تسجيل دخول المستخدم
      } else if (role == 'driver') {
        Get.toNamed('/loginDriver'); // شاشة تسجيل دخول السائق
      }
      Get.snackbar('نجاح', 'تم اختيار الدور بنجاح');
    } else {
      Get.snackbar('خطأ', 'حدث خطأ في اختيار الدور');
    }
  }
}

