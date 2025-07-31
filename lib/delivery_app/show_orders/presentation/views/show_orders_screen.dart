

import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/model/orders_details_model.dart';
import 'package:flutter_application_7/delivery_app/orders_details/presentation/views/orders_details_screen.dart';
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
    return Scaffold(
      drawer: CustomDrawerDelivery(),
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(() => OrderDetailsScreen());
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5), // لون رمادي فاتح للخلفية
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.yellow, width: 2),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                title: Text(
                  "Location: ${locations[index]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 18,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}




