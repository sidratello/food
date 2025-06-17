import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../products/presentation/widgets/custom_product_grid.dart';

class FavoritesScreen extends StatelessWidget {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 4,
        padding: const EdgeInsets.all(12),
        children: controller.favoriteItems
            .map((p) => CustomProductCard(product: p))
            .toList(),
      )),
    );
  }
}
