// lib/Features/Product/presentation/widgets/product_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final bool showName;
  final bool showPrice;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.showName = true,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {

    final imageUrl =
        "http://192.168.1.10:8000/${product.image.split('/').last}";


    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.hardEdge,   //amoid the image to be outside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.broken_image));
                },
              ),
            ),
            if (showName)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            if (showPrice)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("${product.price} ل.س"),
              ),
          ],
        ),
      ),
    );
  }
}

