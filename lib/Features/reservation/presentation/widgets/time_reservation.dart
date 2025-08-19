import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Future<void> _pickTime({required bool isStart}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart
          ? (startTime ?? TimeOfDay.now())
          : (endTime ?? TimeOfDay.now()),
      // Force 24-hour format in the dialog
      builder: (ctx, child) => MediaQuery(
        data: MediaQuery.of(ctx!).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );

    if (picked == null) return;

    // Validate business hours (09:00–21:00)
    if (!_isWithinWorkingHours(picked)) {
      Get.snackbar("تنبيه", "المطعم يعمل من 09:00 حتى 21:00 فقط",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (isStart) {
      setState(() {
        startTime = picked;
        widget.startController.text = _formatTime(picked); // HH:mm
        // If end is already picked and now invalid, clear it
        if (endTime != null && !_isEndAfterStart(startTime!, endTime!)) {
          endTime = null;
          widget.endController.clear();
        }
      });
    } else {
      // Need a start time first
      if (startTime == null) {
        Get.snackbar("تنبيه", "اختر وقت البداية أولاً",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      // End must be after start
      if (!_isEndAfterStart(startTime!, picked)) {
        Get.snackbar("تنبيه", "وقت النهاية يجب أن يكون بعد وقت البداية",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }
      setState(() {
        endTime = picked;
        widget.endController.text = _formatTime(picked); // HH:mm
      });
    }
  }

  bool _isWithinWorkingHours(TimeOfDay t) {
    final m = t.hour * 60 + t.minute;
    return m >= 9 * 60 && m <= 21 * 60; // 09:00–21:00
  }

  bool _isEndAfterStart(TimeOfDay start, TimeOfDay end) {
    final s = start.hour * 60 + start.minute;
    final e = end.hour * 60 + end.minute;
    return e > s;
  }

  String _formatTime(TimeOfDay t) =>
      "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.startController,
          readOnly: true, // prevents manual typing
          onTap: () => _pickTime(isStart: true),
          decoration: const InputDecoration(
            labelText: "وقت البداية (HH:mm)",
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
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.endController,
          readOnly: true, // prevents manual typing
          onTap: () => _pickTime(isStart: false),
          decoration: const InputDecoration(
            labelText: "وقت النهاية (HH:mm)",
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
      ],
    );
  }
}
