import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/date_reservation.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/dropdownButton.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/elevatedbutton_reservation.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/textfieled_reservation.dart';
import 'package:flutter_application_7/Features/reservation/presentation/widgets/time_reservation.dart';
import 'package:flutter_application_7/wedjet/drawer/drawer.dart';
import '../widgets/appbar_reservation.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {

  @override
  Widget build(BuildContext context) {
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
              Dropdownbutton(),
              const SizedBox(height: 20),

              // عدد الأشخاص
              TextfieledReservation(),
              const SizedBox(height: 20),

              // اختيار التاريخ
              DateReservation(),
              const SizedBox(height: 20),


              // اختيار الوقت
           TimeReservation(),
              const SizedBox(height: 30),

              // زر إرسال الحجز
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedbuttonReservation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
