import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class CustomButtonForDetals extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const CustomButtonForDetals({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColor.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
