import 'package:flutter_application_7/Features/Category/data/Serveses/profileserveses.dart';
import 'package:flutter_application_7/Features/Category/data/models/profilemodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProfileController extends GetxController {
  final ProfileService _service = ProfileService();

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final profile = Rxn<ProfileModel>(); // بدال List

  @override
  void onInit() {
    super.onInit();
    fetchProfile(); // مو profile()
  }

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        errorMessage.value = 'يرجى تسجيل الدخول أولاً.';
        return;
      }

      final result = await _service.fetchProfile(token);
      profile.value = result; // خزّن النتيجة
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
