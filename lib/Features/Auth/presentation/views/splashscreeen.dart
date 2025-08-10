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
    _checkUserRole();
  }

  void _checkUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('user_role');
    String? token = prefs.getString('token'); 

    if (token != null) {
      bool isValid = await _validateToken(token);
      if (isValid) {
        if (role == 'user') {
          Get.offNamed('/home');
        } else if (role == 'driver') {
          Get.offNamed('/google');
        }
        return;
      }
    }

    await prefs.clear();
    Get.offNamed('/usertype');
  }

  Future<bool> _validateToken(String token) async {
    try {
      final response = await Api().get(
        url: Applink.ShowFavourit,
        token: token,
      );
      return true;
    } catch (e) {
      if (e.toString().contains('401')) {
        return false;
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
