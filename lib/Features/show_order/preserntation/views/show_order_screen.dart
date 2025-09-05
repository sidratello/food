import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/controller/show_order_controller.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/views/Emty_show_order_screen.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/wedjets/customcardorder.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/show_order/data/model/show_order_model.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

class ShowOrdersScreen extends StatelessWidget {
  ShowOrdersScreen({super.key});

  final ShowOrdersController ctrl = Get.put(ShowOrdersController());

  @override
  Widget build(BuildContext context) {
    return Directionality( // لأن النص عربي
      textDirection: TextDirection.rtl,
      child: CustomScaffold(
            showAppBar: true,
        appBarTitle: 'orders',
      showNavBar: false,

        body: Obx(() {
          if (ctrl.isLoading.value) {
             return const Center(child: CircularProgressIndicator());
          }
    if (ctrl.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                    const SizedBox(height: 12),
                    Text(ctrl.errorMessage.value, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: ctrl.fetchOrders,
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (ctrl.orders.isEmpty) {
       return const Emty_show_order_screen(); 
          }

          return RefreshIndicator(
            onRefresh: ctrl.fetchOrders,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              itemCount: ctrl.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) => OrderCard(order: ctrl.orders[i]),
            ),
          );
        }),
      ),
    );
  }
}



