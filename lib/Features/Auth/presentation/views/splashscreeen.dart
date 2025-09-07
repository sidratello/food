import 'package:flutter/material.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  Future<void> _route() async {
    final prefs = await SharedPreferences.getInstance();
    final role  = prefs.getString('user_role');   // 'user' | 'driver' | null
    final token = prefs.getString('token');       // Bearer token

    // لو فيه توكن غير فارغ جرّب التحقق
    if (token?.isNotEmpty == true) {
      final ok = await _validateToken(token!);
      if (ok) {
        // ✅ توكن صالح → وجّه مباشرة
        if (role == 'driver') {
          Get.offAllNamed('/google'); // شاشتك الخاصة بالسائق
        } else {
          Get.offAllNamed('/home');   // الافتراضي user أو لو role مفقودة
        }
        return;
      }
    }

    // ⛔ لا يوجد توكن أو غير صالح → نظّف مفاتيح الدخول فقط واذهب لاختيار النوع
    await prefs.remove('token');
    await prefs.remove('user_id');
    await prefs.remove('user_role');
    Get.offAllNamed('/usertype');
  }

  /// تحقّق مبسّط من صلاحيّة التوكن
  Future<bool> _validateToken(String token) async {
    try {
      // endpoint اختباري يتطلب مصادقة (بدّله إن أحببت مثلاً /api/me)
      final response = await Api().get(
        url: Applink.ShowFavourit,
        token: token,
      );
      // لو وصلت هنا بدون استثناء، اعتبره صالح
      return true;
    } catch (e) {
      // يفضّل إن Api().get يرمي استثناء بوقت 401/403
      final msg = e.toString();
      if (msg.contains('401') || msg.contains('403')) {
        return false;
      }
      // لأي خطأ شبكة/سيرفر: اعتبره غير صالح أيضاً لتجنّب حبس المستخدم
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
