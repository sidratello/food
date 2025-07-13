import 'package:flutter/material.dart';
import '../widgets/appbar_reservation.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  List<String> occasions = ['عيد ميلاد', 'تخرج', 'مباركة ولادة'];
  final TextEditingController peopleController = TextEditingController();
  String? selectedOccasion;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarReservation(title: "Reservation"),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/reserv2.jpg",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // نوع المناسبة
              DropdownButtonFormField<String>(
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
              ),
              const SizedBox(height: 20),

              // عدد الأشخاص
              TextField(
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
              ),
              const SizedBox(height: 20),

              // اختيار التاريخ
              InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) setState(() => selectedDate = date);
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
                    selectedDate == null
                        ? ''
                        : "${selectedDate!.toLocal()}".split(' ')[0],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // اختيار الوقت
              InkWell(
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) setState(() => selectedTime = time);
                },
                child: InputDecorator(
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
                  child: Text(
                    selectedTime == null
                        ? ''
                        : selectedTime!.format(context),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // زر إرسال الحجز
              SizedBox(
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
                                      Navigator.pop(context); // إغلاق النافذة
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
