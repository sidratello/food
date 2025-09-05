import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_7/Features/Auth/presentation/Controllers/UsertypeController.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class UserTypeChoiceScreen extends StatelessWidget {
  UserTypeChoiceScreen({Key? key}) : super(key: key);

  final ChooseRoleControllerImp controller = Get.put(ChooseRoleControllerImp());

  Future<void> _selectAndGo(String role) async {
    controller.selectRole(role);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
    // إذا تبغى تروح لصفحة تسجيل مباشرة:
    Get.toNamed('/sinup'); // أو '/login' حسب تدفقك
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "Choce the type of user",
              color: AppColor.pink,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Changa ExtraLight',
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Button(
                  title: 'customer',
                  onPressed: () => _selectAndGo('user'),
                  color: Colors.pink,
                ),
                const SizedBox(width: 5),
                Button(
                  title: 'delevery',
                  onPressed: () => _selectAndGo('driver'),
                  color: Colors.pink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
