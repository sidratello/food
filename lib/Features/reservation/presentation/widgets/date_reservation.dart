import 'package:flutter/material.dart';

class DateReservation extends StatefulWidget {
  final TextEditingController controller;

  const DateReservation({super.key, required this.controller});

  @override
  State<DateReservation> createState() => _DateReservationState();
}

class _DateReservationState extends State<DateReservation> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          setState(() => selectedDate = date);
          widget.controller.text = "${date.toLocal()}".split(' ')[0];
        }
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: "اختر التاريخ",
          labelStyle: TextStyle(color: Color(0xfff83962)),
          prefixIcon: Icon(Icons.calendar_month, color: Color(0xfff83962)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        child: Text(
          widget.controller.text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}


