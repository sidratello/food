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
        title: const Text("Order Details"),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Order ID: 1", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("Name: Sham", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("Phone: 0933221122", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                const Text("Total Price: 7000 SYP", style: TextStyle(fontSize: 18)),
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

                _buildProductItem("Chocolate Cake", 2),
                _buildProductItem("Mini Pizza", 3),
                _buildProductItem("Date Maamoul", 1),

                const SizedBox(height: 30),
                const Divider(thickness: 1),
                const Text("Address:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 10),
                const Text("City: City 4", style: TextStyle(fontSize: 16)),
                const Text("Street: Street 4", style: TextStyle(fontSize: 16)),
                const Text("Building: 11", style: TextStyle(fontSize: 16)),
                const Text("Floor: 2", style: TextStyle(fontSize: 16)),
                const Text("Notes: Test address note", style: TextStyle(fontSize: 16)),
              ],
            ),
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
