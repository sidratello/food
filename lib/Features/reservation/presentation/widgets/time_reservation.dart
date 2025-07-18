import 'package:flutter/material.dart';

class TimeReservation extends StatefulWidget {
  final TextEditingController controller;

  const TimeReservation({super.key, required this.controller});

  @override
  State<TimeReservation> createState() => _TimeReservationState();
}

class _TimeReservationState extends State<TimeReservation> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time != null) {
          setState(() {
            selectedTime = time;
            widget.controller.text = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
          });
        }
      },
      child: IgnorePointer(
        child: TextField(
          controller: widget.controller,
          decoration: const InputDecoration(
            labelText: "اختر الوقت",
            labelStyle: TextStyle(color: Color(0xfff83962)),
            prefixIcon: Icon(Icons.access_time, color: Color(0xfff83962)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
