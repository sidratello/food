import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Cart/presentation/views/cart_screen.dart';

import '../../../favorite/presentation/views/favorite_screen.dart';
import '../widgets/custom_product_grid.dart';

class ProductsScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  final List<Product> products = [
    Product(name: 'Cake', image: 'assets/images/save2.png', price: 15.0),
    Product(name: 'Pizza', image: 'assets/images/save2.png', price: 25.0),
    Product(name: 'Burger', image: 'assets/images/save2.png', price: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Get.to(() => FavoritesScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Get.to(() => CartScreen()),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 4,
        padding: const EdgeInsets.all(12),
        children: products.map((p) => CustomProductCard(product: p)).toList(),
      ),
    );
  }
}
