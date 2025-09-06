import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/add_rating_serveses.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddratingController extends GetxController {
  final isLoading = false.obs;
  final AddRatingService _service = AddRatingService();

  /// خريطة: productId -> rating(1..5)
  final RxMap<int, int> ratings = <int, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadRatings();
  }

  // تحميل الخريطة من SharedPreferences
  Future<void> _loadRatings() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('ratings_map');
    if (raw != null && raw.isNotEmpty) {
      final Map<String, dynamic> m = jsonDecode(raw);
      ratings.assignAll(
        m.map((k, v) => MapEntry(int.parse(k), (v as num).toInt())),
      );
    }
  }

  // حفظ الخريطة إلى SharedPreferences
  Future<void> _saveRatings() async {
    final prefs = await SharedPreferences.getInstance();
    final m = ratings.map((k, v) => MapEntry(k.toString(), v));
    await prefs.setString('ratings_map', jsonEncode(m));
  }

  bool isRated(int productId) => ratings.containsKey(productId);
  int getRating(int productId) => ratings[productId] ?? 0;

  /// يرسل التقييم للسيرفر ثم يحفظه محليًا
  Future<bool> rateProduct(int productId, int rate) async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      if (token.isEmpty) {
        Get.snackbar("خطأ", "يرجى تسجيل الدخول أولًا");
        return false;
      }

      final resp = await _service.rate(productId, rate, token);

      // لو السيرفر رجّع رسالة نجاح
      final msg = resp['message']?.toString() ?? 'تم التقييم';
      Get.snackbar("☺️ نجاح ", msg, snackPosition: SnackPosition.BOTTOM);

      // خزّن محليًا
      ratings[productId] = rate;
      await _saveRatings();

      return true;
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ غير متوقع");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
