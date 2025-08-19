import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/cancel_reservation_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/widgets/drawer.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/add_order_controller.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/controllers/show_reservation_controller.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/widgets/appbar_showreservation.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class ShowReservationScreen extends StatelessWidget {
  ShowReservationScreen({super.key});

  final ShowReservationController controller =
      Get.put(ShowReservationController());
  final Add_order_controller addOrderController =
      Get.put(Add_order_controller());
final cancelController = Get.put(CancelReservationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: const CustomAppBarShowReservation(
        title: "My Reservation",
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value != null) {
          return Center(
            child: Text(controller.errorMessage.value ?? 'Unexpected error'),
          );
        }

        if (controller.reservations.isEmpty) {
          return const Center(
            child: Text('لا يوجد حجوزات حالياً.'),
          );
        }

        return Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: controller.reservations.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final reservation = controller.reservations[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4EC), // خلفية زهر فاتح
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.pink.shade100),
                ),
                child: ListTile(
             // يسمح بزيادة الارتفاع إذا احتاج
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "التاريخ : ${reservation.date}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("عدد الكراسي : ${reservation.guestsCount}"),
                      Text(
                        "من: ${reservation.starttime} إلى ${reservation.endtime}",
                      ),
                      const SizedBox(height: 8),

                      // زر تأكيد الطلب
                      ElevatedButton.icon(
                        onPressed: () {
                          addOrderController.Order('local', reservation.id);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.pink,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                        icon: const Icon(Icons.shopping_cart_checkout),
                        label: const Text(
                          "تأكيد الطلب لهذا الحجز",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // الأزرار الجانبية (حذف + تعديل)
                  trailing: Wrap(
                    direction: Axis.vertical,
                    spacing: 8,
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        iconSize: 26,
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                   


cancelController.cancel(reservation.id);

                        },
                      ),
                      // IconButton(
                      //   constraints: const BoxConstraints(),
                      //   padding: EdgeInsets.zero,
                      //   iconSize: 26,
                      //   icon: const Icon(Icons.edit, color: Colors.grey),
                      //   onPressed: () {
                      //     Get.to(() => ReservationScreen());
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => ReservationScreen());
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
