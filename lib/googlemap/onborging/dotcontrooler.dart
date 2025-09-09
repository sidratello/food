import 'package:flutter/material.dart';
import 'package:flutter_application_7/controller/onbording_controller.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/data/datasource/static/static.dart';
import 'package:get/get.dart';

class customdotcontrollerbording extends StatelessWidget {
  const customdotcontrollerbording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoringgControllerImp>(
      builder: (controller)
    => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    margin: const EdgeInsets.symmetric(horizontal: 5), // مسافة بين الدوائر
                    width: controller.curentpage==index ? 20 : 5, // تحديد العرض
                    height: 6, // تحديد الارتفاع
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.pink,
                    ),
                  ),
                ),
              ));

  }
}