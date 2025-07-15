import 'package:flutter/material.dart';

class TextfieledReservation extends StatelessWidget {
   TextfieledReservation({super.key});
  final TextEditingController peopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: peopleController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "عدد الأشخاص",
        labelStyle: TextStyle(color:  Color(0xfff83962)),
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
