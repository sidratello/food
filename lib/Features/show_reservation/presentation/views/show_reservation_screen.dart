import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/show_reservation_controller.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/widgets/appbar_showreservation.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';

import '../../../../wedjet/drawer/drawer.dart';

class ShowReservationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reservations = [
    {
      'date': '14-08-2024',
      'guestsCount': 5,
      'starttime': '2',
      'diningTableId': 2,
    },
    {
      'date': '20-08-2024',
      'guestsCount': 3,
      'starttime': '4',
      'diningTableId': 1,
    },
    // أضيفي المزيد من الحجوزات إذا بدك
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      // الخلفية بيضاء
      appBar: CustomAppBarShowReservation(
        title: "My Reservation",
      ),
      body: GetBuilder(
        init: ShowReservationController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage != null) {
            return Center(
                child: Text(controller.errorMessage ?? 'unexpected error'));
          }
          return controller.reservations.isEmpty
              ? const Center(child: Text('لا يوجد حجوزات حالياً.'))
              : ListView.builder(
                  itemCount: controller.reservations.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final reservation = controller.reservations[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE4EC), // زهر فاتح
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.pink.shade100),
                      ),
                      child: ListTile(
                        //contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("التاريخ : ${reservation.date}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("عدد الكراسي : ${reservation.guestsCount}"),
                            Text("الساعة : ${reservation.starttime}"),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            // CircleAvatar(
                            //   backgroundColor: Colors.black,
                            //   foregroundColor: Colors.white,
                            //   radius: 14,
                            //   child: Text("${reservation['diningTableId']}", style: TextStyle(fontSize: 14)),
                            // ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // هون ممكن تضيفي وظيفة حذف إذا بدك
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ElevatedButton(
          onPressed: () {
            Get.to(ReservationScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.pink,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "إضافة حجز جديد +",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
