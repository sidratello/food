
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/drawer.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/date_reservation.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/occasions.dart';

import 'package:flutter_application_7/Features/reservation/presentation/widgets/textfieled_reservation.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/time_reservation.dart';

import 'package:get/get.dart';

import '../controllers/reservation_controller.dart';
import '../widgets/appbar_reservation.dart';
import '../widgets/elevatedbutton_reservation.dart';

class ReservationScreen extends StatefulWidget {
  ReservationScreen({super.key,});

  final Reservation_Controller controller = Get.put(Reservation_Controller());


  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {


    final TextEditingController dateController = TextEditingController();
    final TextEditingController guestsController = TextEditingController();
    final TextEditingController occasionsController = TextEditingController();
    final TextEditingController startTimeController = TextEditingController();
    final TextEditingController endTimeController = TextEditingController();



    return Scaffold(
      drawer: CustomDrawer(),
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
              Occasions(controller: occasionsController),
              const SizedBox(height: 20),

              // عدد الأشخاص
              TextfieledReservation(controller: guestsController),
              const SizedBox(height: 20),

              // اختيار التاريخ
              DateReservation(controller: dateController),
              const SizedBox(height: 20),

              // اختيار الوقت
              TimeReservation(
                startController: startTimeController,
                endController: endTimeController,
              ),
              const SizedBox(height: 30),

              // زر إرسال الحجز
              ElevatedbuttonReservation(
                dateController: dateController,
                guestsController: guestsController,
                occasionsController: occasionsController,
                startTimeController: startTimeController,
                endTimeController: endTimeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
