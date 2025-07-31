import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String selectedStatus = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
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
              mainAxisSize: MainAxisSize.min, // حتى ما يتمدد زيادة
              children: [
                const Text("order number: 1", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("Name: Sham ", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("phone number: 0933221122", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("Total price: 7000 ل.س", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                const Text("Order status:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildStatusButton("Delivery"),
                    const SizedBox(width: 10),
                    _buildStatusButton("Done"),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Order status: $selectedStatus",
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),

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
      onPressed: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Text(status),
    );
  }
}
