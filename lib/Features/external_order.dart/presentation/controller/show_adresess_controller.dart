import 'package:flutter_application_7/Features/external_order.dart/data/serveses/showadresess_serveses.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_7/Features/external_order.dart/data/model/show_adress_model.dart';


class ShowAddressController extends GetxController {
  // الخدمة
  final show_Adress_serveses _service = show_Adress_serveses();

  // الحالة
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // البيانات
  final addresses = <AddressModel>[].obs;
  AddressModel? selectedAddress;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  /// جلب العناوين من الـ API
  Future<void> fetchAddresses() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      if (token.isEmpty) {
        errorMessage.value = 'يرجى تسجيل الدخول أولاً.';
        addresses.clear();
        return;
      }

      final result = await _service.show_Adress(token);

      if (result is List<AddressModel>) {
        addresses.assignAll(result);
    
    
      } else {
        errorMessage.value = 'استجابة غير متوقعة من الخادم.';
        addresses.clear();
      }
    } catch (e) {
      errorMessage.value = e.toString();
      addresses.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
