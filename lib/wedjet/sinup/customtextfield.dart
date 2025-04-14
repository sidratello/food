

import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor; 
  final TextEditingController? controller;
final Icon icon;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
  required   this.controller,
    required this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0), // إضافة مسافة حول الأيقونة
          child: icon,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.pink,
            width: 2.0, // عرض الإطار
          ),
        ),
        
        hintText: hintText,
          contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}