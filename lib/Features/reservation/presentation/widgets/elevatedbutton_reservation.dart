import 'package:flutter/material.dart';

class ElevatedbuttonReservation extends StatelessWidget {
   ElevatedbuttonReservation({super.key});

  List<String> occasions = ['عيد ميلاد', 'تخرج', 'مباركة ولادة'];
  final TextEditingController peopleController = TextEditingController();
  String? selectedOccasion;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xfff83962),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (selectedDate != null && selectedTime != null && peopleController.text.isNotEmpty) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                "تأكيد الحجز",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "تم اختيار الحجز\nفي التاريخ ${selectedDate!.toLocal().toString().split(' ')[0]}\nالساعة ${selectedTime!.format(context)}\nو عدد الكراسي ${peopleController.text}\nو المناسبة  ${selectedOccasion}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xfff83962), // لون الزر داخل النافذة
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                Text("تم الحجز بنجاح",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                    width: double.infinity,
                                    child: TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("موافق"))
                                ),
                              ],
                            ),
                          ),
                        ); // إغلاق النافذة
                      },
                      child: const Text(
                        "تأكيد الحجز",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // في حال نقص البيانات
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("يرجى تعبئة كل الحقول أولاً"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const Text(
        "إرسال معلومات الحجز",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
