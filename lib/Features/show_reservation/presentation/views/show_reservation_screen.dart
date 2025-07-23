import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/reservation/data/resrevation_model.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/show_reservation_controller.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/widgets/appbar_showreservation.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';

import '../../../../wedjet/drawer/drawer.dart';

class ShowReservationScreen extends StatelessWidget {
  final ShowReservationController controller =
      Get.put(ShowReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: const CustomAppBarShowReservation(
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
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    itemCount: controller.reservations.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final reservation = controller.reservations[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE4EC), // زهر فاتح
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.pink.shade100),
                        ),
                        child: ListTile(
                          //contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("التاريخ : ${reservation.date}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text("عدد الكراسي : ${reservation.guestsCount}"),
                              Text("الساعة : ${reservation.starttime}"),
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    controller.cancelReservation(reservation.id);
                                    controller.getReservations();
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 3,
                                child: SizedBox(height: 30),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      ReservationScreen(
                                        reservationModel: ReservationModelForm(
                                          date: reservation.date.toString(),
                                          guestsCount: reservation.guestsCount
                                              .toString(),
                                          notes: reservation.notes,
                                          startTime: reservation.starttime,
                                          endTime: reservation.endtime,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "إضافة حجز جديد +",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
