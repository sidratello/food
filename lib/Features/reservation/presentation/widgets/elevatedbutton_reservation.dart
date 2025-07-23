import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/reservation/presentation/controllers/reservation_controller.dart';
import 'package:get/get.dart';


class ElevatedbuttonReservation extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController guestsController;
  final TextEditingController occasionsController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final bool isEdit;
  final int? reservationId;

  ElevatedbuttonReservation(
      {super.key,
      required this.dateController,
      required this.guestsController,
      required this.occasionsController,
      required this.startTimeController,
      required this.endTimeController,
      required this.isEdit,
        this.reservationId,
      });


  final ReservationController controller = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    final String buttonTitle = isEdit ? "تعديل الحجز" : "أرسل الحجز";
    return GetBuilder<ReservationController>(
      builder: (controller) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xfff83962),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              final date = dateController.text;
              final guests = guestsController.text;
              final occasion = occasionsController.text;
              final startTime = startTimeController.text;
              final endTime = endTimeController.text;

              if (date.isEmpty ||
                  guests.isEmpty ||
                  occasion.isEmpty ||
                  startTime.isEmpty ||
                  endTime.isEmpty) {
                Get.snackbar("خطأ", "يرجى تعبئة جميع الحقول");
                return; // بتوقف التنفيذ هون إذا في حقل فاضي
              }
              final guestsCount = int.tryParse(guests) ?? 1;

              controller.postReservations(
                date,
                guestsCount,
                occasion,
                startTime,
                endTime,
                isEdit,
                  reservationId

              );
              Get.back();
            },
            child: Text(buttonTitle, style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
