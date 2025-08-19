import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Occasions extends StatelessWidget {
  final TextEditingController controller;

  const Occasions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "نوع المناسبة",
        labelStyle: TextStyle(color: Color(0xfff83962)),
        prefixIcon: Icon(Icons.add_card, color: Color(0xfff83962)),
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
