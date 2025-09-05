import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  static const _prefKey = 'themeMode';
  final themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    _loadTheme();
    super.onInit();
  }

  Future<void> _loadTheme() async {
    final p = await SharedPreferences.getInstance();
    final saved = p.getString(_prefKey) ?? 'system';
    themeMode.value = _parse(saved);
    Get.changeThemeMode(themeMode.value);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    final p = await SharedPreferences.getInstance();
    await p.setString(_prefKey, _stringify(mode));
  }

  String _stringify(ThemeMode m) =>
      m == ThemeMode.light ? 'light' : m == ThemeMode.dark ? 'dark' : 'system';
  ThemeMode _parse(String s) =>
      s == 'light' ? ThemeMode.light : s == 'dark' ? ThemeMode.dark : ThemeMode.system;
}
