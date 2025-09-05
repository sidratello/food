import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final IconData? suffixIcon;
  final int maxLines; //how many line should the user enter
  final bool isObscure;//disapear the text that we see like the password 
  final TextInputType keyboardType;
  

  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'أدخل النص هنا...',
    this.suffixIcon,
    this.maxLines = 1,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isObscure,
        keyboardType: keyboardType,
        maxLines: maxLines,
        textAlign: TextAlign.right,

        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          filled: true,
   fillColor: Colors.grey.shade200,

          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
     
                borderSide: BorderSide(color: Colors.grey, width: 1), 
          ),
        ),
      ),
    );
  }
}
