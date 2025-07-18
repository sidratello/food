import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/reservation/presentation/controllers/reservation_controller.dart';
import 'package:get/get.dart';

class ElevatedbuttonReservation extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController guestsController;
  final TextEditingController occasionsController;
  final TextEditingController timeController;

  ElevatedbuttonReservation({
    super.key,
    required this.dateController,
    required this.guestsController,
    required this.occasionsController,
    required this.timeController,
  });

  final ReservationController controller = Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
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
                final time = timeController.text;

                if (date.isEmpty || guests.isEmpty || occasion.isEmpty || time.isEmpty) {
                  Get.snackbar("خطأ", "يرجى تعبئة جميع الحقول");
                  return; // بتوقف التنفيذ هون إذا في حقل فاضي
                }
                final guestsCount = int.tryParse(guests) ?? 1;

                controller.postReservations(
                  date,
                  guestsCount,
                  occasion,
                  time,
                );

            },
            child: Text("أرسل الحجز", style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}

// if (selectedDate != null && selectedTime != null && peopleController.text.isNotEmpty) {
// showDialog(
// context: context,
// builder: (context) => AlertDialog(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(16),
// ),
// title: const Text(
// "تأكيد الحجز",
// style: TextStyle(fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
// content: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// const SizedBox(height: 10),
// Text(
// "تم اختيار الحجز\nفي التاريخ ${selectedDate!.toLocal().toString().split(' ')[0]}\nالساعة ${selectedTime!.format(context)}\nو عدد الكراسي ${peopleController.text}\nو المناسبة  ${selectedOccasion}",
// textAlign: TextAlign.center,
// style: const TextStyle(fontSize: 16),
// ),
// const SizedBox(height: 20),
// SizedBox(
// width: double.infinity,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor:  Color(0xfff83962), // لون الزر داخل النافذة
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// ),
// onPressed: () {
// showDialog(
// context: context,
// builder: (context) => AlertDialog(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(16),
// ),
// content: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// const SizedBox(height: 10),
// Text("تم الحجز بنجاح",
// textAlign: TextAlign.center,
// style: const TextStyle(fontSize: 16),
// ),
// const SizedBox(height: 20),
// SizedBox(
// width: double.infinity,
// child: TextButton(onPressed: (){
// Navigator.pop(context);
// }, child: Text("موافق"))
// ),
// ],
// ),
// ),
// ); // إغلاق النافذة
// },
// child: const Text(
// "تأكيد الحجز",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// );
// } else {
// // في حال نقص البيانات
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("يرجى تعبئة كل الحقول أولاً"),
// backgroundColor: Colors.red,
// ),
// );
// }
// },
// child: const Text(
// "إرسال معلومات الحجز",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 16,
// ),
// ),
