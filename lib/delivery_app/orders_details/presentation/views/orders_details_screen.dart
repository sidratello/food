import 'package:flutter/material.dart';
import 'package:flutter_application_7/delivery_app/orders_details/presentation/controllers/orders_details_controller.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int orderId; // 🟢 نستقبل orderId

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late final ShowOrdersDetailsController controller;

  String selectedStatus = 'Delivery';

  @override
  void initState() {
    super.initState();
    // 🟢 هون منمرر orderId للكونترولر
    controller = Get.put(ShowOrdersDetailsController(widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: GetBuilder<ShowOrdersDetailsController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          return ListView.builder(
            itemCount: controller.ordersdetails.length,
            itemBuilder: (context, index) {
              final orderdetails = controller.ordersdetails[index];

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${orderdetails.order.user.username}", style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text("Phone: ${orderdetails.order.user.mobile}", style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      Text("Total Price: ${orderdetails.order.totalPrice} SYP", style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 20),

                      const Text("Order Status:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _buildStatusButton("Delivery"),
                          const SizedBox(width: 10),
                          _buildStatusButton("Done"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Current Status: $selectedStatus", style: const TextStyle(fontSize: 16)),

                      const SizedBox(height: 30),
                      const Divider(thickness: 1),
                      const Text("Products:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 10),

                      Column(
                        children: orderdetails.order.products.map((product) {
                          return _buildProductItem(product.name, product.quantity);
                        }).toList(),
                      ),

                      const SizedBox(height: 30),
                      const Divider(thickness: 1),
                      const Text("Address:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 10),
                      Text("City: ${orderdetails.order.address.city}", style: const TextStyle(fontSize: 16)),
                      Text("Street: ${orderdetails.order.address.street}", style: const TextStyle(fontSize: 16)),
                      Text("Building: ${orderdetails.order.address.building}", style: const TextStyle(fontSize: 16)),
                      Text("Floor: ${orderdetails.order.address.floor}", style: const TextStyle(fontSize: 16)),
                      Text("Notes: ${orderdetails.order.address.notes}", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    final isSelected = selectedStatus == status;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.yellow[700] : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () async {
        setState(() {
          selectedStatus = status;
        });

        // 🟢 إرسال الحالة الجديدة للـ backend
        if (status == "Delivery") {
          await controller.markAsInDelivery(widget.orderId);
        } else if (status == "Done") {
          await controller.markAsCompleted(widget.orderId);
        }

        // بعد ما يرجع الرد، يمكن تحديث الـ UI لو لازم
        setState(() {
          selectedStatus = status;
        });
      },
      child: Text(status),
    );
  }

  Widget _buildProductItem(String name, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Text("Quantity: $quantity", style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
