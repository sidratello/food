
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/category_controller.dart';

import 'package:flutter_application_7/Features/Category/presentation/wedjets/CustomSearchTextField.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/appbarCategory.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/customCategoryCard.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_Screen.dart';

import 'package:get/get.dart';

import '../../../../wedjet/drawer/drawer.dart';



class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController controller = Get.put(CategoryController());
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: const CustomAppBar(title: 'Menu'),
      body: Column(
        children: [
          // ✅ حقل البحث
          CustomSearchField(
            controller: _searchController,
            onChanged: controller.onSearch,
          ),

          // ✅ النتائج أو التصنيفات
          Expanded(
            child: Obx(() {
              if (controller.isSearching.value) {
                if (controller.searchResults.isEmpty) {
                  return const Center(child: Text('لا توجد نتائج'));
                }
//search result have the data we search about 
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    final item = controller.searchResults[index];
                    final isProduct = item.containsKey('price');

                    final imagePath = item['image']?.toString() ?? '';
                    final imageUrl =
                        'http://192.168.1.10:8000/${imagePath.split('/').last}';

                    return GestureDetector(
                      onTap: () {
                        if (!isProduct) {
                          Get.to(() => ProductsScreen(
                                categoryId: item['id'],
                                categoryName: item['name'],
                                categoryImage: item['image'],
                              ));
                        } else {
                          print("✅ منتج: ${item['name']}");
                        }
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(item['name']),
                          subtitle: isProduct                         //the defernt btween the product and category is the price 

                              ? Text('السعر: ${item['price']}')       // this ? mean do and : mean else 
                              : const Text('تصنيف'),
                          leading: Image.network(
                            imageUrl,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } 
              
              else {                                  //else if he doesnt search the category apear 
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return CategoryCard(category: category);
                  },
                );
              }
            }
            ),
          ),
        ],
      ),
    );
  }
}
