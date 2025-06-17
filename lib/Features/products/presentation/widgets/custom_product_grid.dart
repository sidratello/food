import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;
  final CartController controller = Get.find();

  CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('${product.price} p.c', style: const TextStyle(color: Colors.green)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    controller.toggleFavorite(product);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    controller.addToCart(product);
                    Get.snackbar("تمت الإضافة", "${product.name} أُضيفت للسلة");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class Product {
  final String name;
  final String image;
  final double price;
  bool isFavorite;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });
}


class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    update(); // لتحديث واجهات GetBuilder أو Obx
  }
}
