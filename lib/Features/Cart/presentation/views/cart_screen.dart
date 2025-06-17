import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/presentation/widgets/custom_product_grid.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('السلة فارغة'));
        }
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return ListTile(
              leading: Image.asset(item.image, width: 50),
              title: Text(item.name),
              subtitle: Text('${item.price} p.c'),
            );
          },
        );
      }),
    );
  }
}
