import 'package:flutter_application_7/Features/mufaza/data/serveses/show_mufaza.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// لو تريد تحديث كنترولر التعبئة القديم بعد الجلب:
// import 'package:flutter_application_7/Features/mufaza/presentation/controller/fill_muhfaza_controller.dart';

class ShowMufazaController extends GetxController {
  final ShowMufazaServeses _service = ShowMufazaServeses();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  /// الرصيد والعملة من السيرفر
  final balance = 0.0.obs;     // double للتمثيل الدقيق
  final currency = ''.obs;

  /// صيغة جاهزة للعرض
  String get formattedBalance => '${balance.value.toStringAsFixed(2)} ${currency.value}';

  @override
  void onInit() {
    super.onInit();
    fetchWallet();
  }

  Future<void> fetchWallet() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      if (token.isEmpty) {
        errorMessage.value = 'يرجى تسجيل الدخول أولاً.';
        balance.value = 0.0;
        currency.value = '';
        return;
      }

      final info = await _service.showMufaza(token);
      balance.value = info.balance;     // مثال: 1200180.00
      currency.value = info.currency;   // مثال: USD

      // (اختياري) خزنها محلياً
      await prefs.setDouble('wallet_balance_double', info.balance);
      await prefs.setString('wallet_currency', info.currency);

      // (اختياري) مزامنة مع كنترولر التعبئة القديم الذي يحفظ int:
      // if (Get.isRegistered<AddToMuhfazaController>()) {
      //   Get.find<AddToMuhfazaController>().balance.value = info.balance.round();
      // }

    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
