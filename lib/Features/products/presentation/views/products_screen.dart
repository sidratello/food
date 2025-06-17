import 'package:flutter/material.dart';

import '../widgets/appbar_products.dart';
import '../widgets/custom_product_grid.dart';
import '../widgets/custom_textfieldSearch_products.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // بيانات المنتجات (اسم، صورة، سعر) بشكل منفصل
  final List<String> names = ["Cake", "Pizza", "Burger"];
  final List<String> images = [
    "assets/images/save2.png",
    "assets/images/save2.png",
    "assets/images/save2.png"
  ];
  final List<double> prices = [15.0, 25.0, 20.0];

  // نتابع حالة المفضلة لكل عنصر
  late List<bool> favorites;

  @override
  void initState() {
    super.initState();
    favorites = List.generate(names.length, (_) => false); // كلهم مو مفضلة بالبداية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarProducts(title: "Products"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextfieldsearchProducts(controller: _searchController),
            GridView.builder(
              itemCount: names.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return CustomProductCard(
                  name: names[index],
                  image: images[index],
                  price: prices[index],
                  isFavorite: favorites[index],
                  onFavoriteToggle: () {
                    setState(() {
                      favorites[index] = !favorites[index];
                    });
                  },
                  onAddToCart: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${names[index]} added to cart')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
