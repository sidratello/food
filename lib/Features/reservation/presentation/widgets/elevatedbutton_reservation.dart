import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/controllers/reservation_controller.dart';



import 'package:get/get.dart';

class ElevatedbuttonReservation extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController guestsController;
  final TextEditingController occasionsController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  const ElevatedbuttonReservation({
    super.key,
    required this.dateController,
    required this.guestsController,
    required this.occasionsController,
    required this.startTimeController,
    required this.endTimeController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Reservation_Controller>(
      builder: (c) {
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff83962),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              // 1) جمع المدخلات
              final date = dateController.text.trim();
              final startTime = startTimeController.text.trim();
              final endTime = endTimeController.text.trim();
              final notes = occasionsController.text.trim();
              final guestsText = guestsController.text.trim();

              // 2) تحققات سريعة قبل الاستدعاء
              if (date.isEmpty || startTime.isEmpty || endTime.isEmpty || guestsText.isEmpty) {
                Get.snackbar("تنبيه", "أكمل جميع الحقول");
                return;
              }

              final guests = int.tryParse(guestsText);
              if (guests == null || guests <= 0) {
                Get.snackbar("تنبيه", "عدد الأشخاص غير صالح");
                return;
              }

              // 3) استدعاء الكنترولر
              await c.submit(
                date,
                guests,
                notes,
                startTime,
                endTime,
              );

              // 4) مثال: لو نجح الحجز ممكن تنتقل لصفحة التأكيد
              // if (/* حالة نجاحك */) Get.to(() => ShowReservationScreen());
            },
            child: const Text('احجز الآن', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
