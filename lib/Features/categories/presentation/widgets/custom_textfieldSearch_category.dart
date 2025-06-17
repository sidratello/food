import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';

class CustomTextfieldsearchCategory extends StatefulWidget {

  @override
  State<CustomTextfieldsearchCategory> createState() => _CustomTextfieldsearchCategoryState();
}

class _CustomTextfieldsearchCategoryState extends State<CustomTextfieldsearchCategory> {
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
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _searchController,
        onChanged: _filterCategories,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
