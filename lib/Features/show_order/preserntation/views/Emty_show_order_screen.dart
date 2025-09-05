import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_for_Emptyfavourite%20Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

class Emty_show_order_screen extends StatelessWidget {
  const Emty_show_order_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
        appBarTitle: 'orders',
      showNavBar: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppImageAsset.emty_order,
                  width: 200,
                  height: 200,
                     fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              CustomMessageText(
                text: 'No Order yet',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 12),
              CustomMessageText(
                text: 'Start your first order to see it here',
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
