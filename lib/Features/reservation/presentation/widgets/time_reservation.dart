import 'package:flutter/material.dart';

class TimeReservation extends StatefulWidget {
  final TextEditingController startController;
  final TextEditingController endController;

  const TimeReservation({
    super.key,
    required this.startController,
    required this.endController,
  });

  @override
  State<TimeReservation> createState() => _TimeReservationState();
}

class _TimeReservationState extends State<TimeReservation> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> pickTime({
    required BuildContext context,
    required bool isStart,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? (startTime ?? TimeOfDay.now()) : (endTime ?? TimeOfDay.now()),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
          widget.startController.text = _formatTime(picked);
        } else {
          endTime = picked;
          widget.endController.text = _formatTime(picked);
        }
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => pickTime(context: context, isStart: true),
          child: IgnorePointer(
            child: TextField(
              controller: widget.startController,
              decoration: const InputDecoration(
                labelText: "وقت البداية",
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
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => pickTime(context: context, isStart: false),
          child: IgnorePointer(
            child: TextField(
              controller: widget.endController,
              decoration: const InputDecoration(
                labelText: "وقت النهاية",
                labelStyle: TextStyle(color: Color(0xfff83962)),
                prefixIcon: Icon(Icons.access_time_filled, color: Color(0xfff83962)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
