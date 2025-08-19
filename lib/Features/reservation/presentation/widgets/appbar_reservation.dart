import 'package:flutter/material.dart';

import 'package:flutter_application_7/Features/show_reservation/presentation/views/show_reservation_screen.dart';
import 'package:get/get.dart';


class CustomAppBarReservation extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBarReservation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
          Get.to(ShowReservationScreen());
        },

            icon: Icon(Icons.home_repair_service_rounded))

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
