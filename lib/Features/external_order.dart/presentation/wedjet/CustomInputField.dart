import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color:const Color.fromARGB(255, 89, 21, 36)),
          labelStyle: const TextStyle(color:AppColor.pink),
          filled: true,
          // fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:AppColor.pink),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.pink, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
