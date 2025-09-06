import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/snackbar_to_choose_the_type_of_location.dart';
import 'package:get/get.dart';

class OrderTypeButton extends StatelessWidget {
  const OrderTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.store),
                    title: const Text("طلب داخلي (داخل المطعم)"),
                    onTap: () {
                      Navigator.pop(context);
                Get.to(ReservationScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delivery_dining),
                    title: const Text("طلب خارجي (خارج المطعم)"),
                    onTap: () {
                      Navigator.pop(context);
           showLocationChoiceDialog(context);

                    },
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          "Order Now",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
