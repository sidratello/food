import 'package:flutter/material.dart';
import 'custom_category_card.dart';
import '../../../../data/model/category_model.dart';

class ExpandedCategory extends StatelessWidget {
  final List<CategoryModel> categories;

  const ExpandedCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const Expanded(
        child: Center(child: Text("لا توجد نتائج")),
      );
    }

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomCategoryCard(
              title: item.title,
              image: item.image,
            ),
          );
        },
      ),
    );
  }
}
