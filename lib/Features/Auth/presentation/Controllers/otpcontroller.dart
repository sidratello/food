// file: Features/Auth/presentation/Controllers/OtpController.dart
import 'package:flutter_application_7/Features/Auth/data/veryfay_serveses.dart'; // أو سيرفس واحد موحّد لإرسال الـ OTP
import 'package:flutter_application_7/Features/Auth/presentation/views/NewPassword_Screen.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final DataVarificationFirst _dataVarification = DataVarificationFirst();

  /// fromSignup: true  => تدفق التسجيل
  /// fromSignup: false => تدفق "نسيت كلمة المرور"
  Future<void> verifyOtp({
    required int userId,
    required String code,
    required bool fromSignup,
  }) async {
    try {
      final response = await _dataVarification.getData(userId: userId, otpValue: code);

      // بعض الـ APIs ترجع "Verified successfully" بدون نقطة، وأخرى "Verified successfully."
      final msg = (response is Map && response['message'] != null)
          ? response['message'].toString().trim()
          : '';

      if (msg == 'Verified successfully' || msg == 'Verified successfully.') {
        Get.snackbar("تم التحقق", "تم التحقق من الرمز بنجاح");

        if (fromSignup) {
          // مسار التسجيل: ادخل التطبيق
          Get.offAll(() => HomePage());
        } else {
          // مسار نسيت كلمة المرور: انتقل لشاشة كلمة مرور جديدة
          Get.offAll(() => New_Password_Screen(userId: userId));
        }
      } else {
        Get.snackbar("فشل التحقق", "الرمز غير صحيح أو منتهي الصلاحية");
      }
    } catch (e) {
      Get.snackbar("خطأ", "تعذر التحقق من الرمز: $e");
    }
  }
}
