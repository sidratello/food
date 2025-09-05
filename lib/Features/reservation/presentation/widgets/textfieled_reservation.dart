import 'package:flutter/material.dart';

class TextfieledReservation extends StatelessWidget {
  final TextEditingController controller;

  const TextfieledReservation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "عدد الأشخاص",
        labelStyle: TextStyle(color: Color(0xfff83962)),
        prefixIcon: Icon(Icons.chair_alt, color: Color(0xfff83962)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}
