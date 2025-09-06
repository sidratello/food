import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/orders_details_model.dart';
import 'package:flutter_application_7/delivery_app/orders_details/presentation/views/orders_details_screen.dart';
import 'package:flutter_application_7/delivery_app/show_orders/presentation/controllers/show_orders_controller.dart';
import 'package:flutter_application_7/wedjet/drawer/drawer_delivery.dart';
import 'package:get/get.dart';

class ShowOrdersScreen extends StatelessWidget {
  final List<String> locations = [
    "Damascus, Alkoussour",
    "Damascus, Almazzeh",
    "Damascus, Almouhagreen",
    "Damascus, Almidan"
  ];

  @override
  Widget build(BuildContext context) {
    final ShowOrdersController controller = Get.put(ShowOrdersController());

    return Scaffold(
      drawer: CustomDrawerDelivery(),
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(
              child: Text(controller.errorMessage.value),
            );
          }
          if (controller.orders.isEmpty) {
            return const Center(
              child: Text('لا يوجد طلبات حاليا'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.orders.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> order = controller.orders[index];

              return GestureDetector(
                onTap: () {
                  final int orderId = order['order_id'];
                  Get.to(() => OrderDetailsScreen(orderId: orderId));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                  child: ListTile(
                    title: Text(
                      "City: ${order['location']?['city'] ?? 'No city'}, "
                          "Street: ${order['location']?['street'] ?? 'No street'}",
                    ),


                    trailing: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text("${index + 1}", style: TextStyle(color: Colors.yellow)),
                    ),
                  ),
                ),
              );
            },

          );
        },
      ),
    );
  }
}
