import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';

class ExpandedCategory extends StatefulWidget {
  const ExpandedCategory({super.key});

  @override
  State<ExpandedCategory> createState() => _ExpandedCategoryState();
}

class _ExpandedCategoryState extends State<ExpandedCategory> {
  final TextEditingController _searchController = TextEditingController();

  List<CategoryModel> allCategoriesFromApi = [];
  // ✅ التصنيفات القادمة من السيرفر
  List<CategoryModel> filteredCategories = [];

  void _filterCategories(String query) {
    final results = allCategoriesFromApi.where((item) {
      final title = item.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCategories = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: filteredCategories.length,
        itemBuilder: (context, index) {
          final item = filteredCategories[index];
          return GestureDetector(
            onTap: () {
              // Navigate to menu
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 140,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.image), // ✅ من API
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
