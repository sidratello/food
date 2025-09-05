

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor; 
  final TextEditingController? controller;
    final String? Function(String?)? validator; //function have string as input or null  and return string  or null.. ? it may be null may i didnt write it in textfield i didnt want validation 
  // final TextInputType? keyboardType;

final Icon icon;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    required this.hintTextColor,
       this.validator,
    //  this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      // keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0), 
          child: icon,
        ),
        border: OutlineInputBorder( // border تعني شكل الإطار الخارجي لحقل الإدخال (TextFormField).
          borderSide: const BorderSide(
            color: Colors.cyan,
            width: 2.0, // عرض الإطار
          ),
        ),
        
        hintText: hintText,
          contentPadding: const EdgeInsets.all(15),//إضافة مسافة داخلية (padding) حول محتوى الحقل نفسه
             enabledBorder: OutlineInputBorder( //without click on textfield 
          borderRadius: BorderRadius.circular(30), 
       
      ),
      ),
    );
  }
}