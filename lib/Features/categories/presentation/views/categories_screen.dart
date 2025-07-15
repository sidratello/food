import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';
import '../../../../wedjet/drawer/drawer.dart';
import '../../../products/presentation/widgets/appbar_products.dart';
import '../widgets/custom_appBar_category.dart';
import '../widgets/custom_category_card.dart';
import '../widgets/custom_textfieldSearch_category.dart';
import '../widgets/expanded_category.dart';
import '../../../../data/model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  // List<CategoryModel> filteredCategories = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   filteredCategories = List.from(allCategories);
  //   _searchController.addListener(() {
  //     _filterCategories(_searchController.text);
  //   });
  // }
  //
  // void _filterCategories(String query) {
  //   setState(() {
  //     if (query.isEmpty) {
  //       filteredCategories = List.from(allCategories);
  //     } else {
  //       filteredCategories = allCategories.where((item) {
  //         return item.title.toLowerCase().contains(query.toLowerCase());
  //       }).toList();
  //     }
  //   });
  // }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCategory(title: "Categories"),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          CustomTextfieldsearchCategory(controller: _searchController),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                CustomCategoryCard(
                  title: "Category 1",
                  image: "assets/images/save.png",
                ),
                SizedBox(height: 16),
                CustomCategoryCard(
                  title: "Category 2",
                  image: "assets/images/save.png",
                ),
                SizedBox(height: 16),
                CustomCategoryCard(
                  title: "Category 3",
                  image: "assets/images/save.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
