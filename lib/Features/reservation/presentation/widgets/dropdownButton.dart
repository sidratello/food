import 'package:flutter/material.dart';

class Dropdownbutton extends StatefulWidget {
   Dropdownbutton({super.key});

  @override
  State<Dropdownbutton> createState() => _DropdownbuttonState();
}

class _DropdownbuttonState extends State<Dropdownbutton> {
  List<String> occasions = ['عيد ميلاد', 'تخرج', 'مباركة ولادة'];

  String? selectedOccasion;


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "نوع المناسبة",
        labelStyle: TextStyle(color: Color(0xfff83962)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      value: selectedOccasion,
      onChanged: (value) => setState(() => selectedOccasion = value),
      items: occasions
          .map((o) => DropdownMenuItem(
        value: o,
        child: Text(
          o,
          style: const TextStyle(color: Colors.black),
        ),
      ))
          .toList(),
      style: const TextStyle(color: Color(0xfff83962)),
      iconEnabledColor: Color(0xfff83962),
    );
  }
}
