import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/category_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/drawer.dart';

import 'package:flutter_application_7/Features/Category/presentation/wedjets/CustomSearchTextField.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/customCategoryCard.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_Screen.dart';

import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';


import 'package:get/get.dart';



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
    // return Scaffold(
    //   appBar: const CustomAppBar(title: 'Menu'),
    return CustomScaffold(
            drawer:  CustomDrawer(),
      showAppBar: true,
      appBarTitle: 'Menu',
      showNavBar: false,
      showBackButton: false, 
    
      body: Column(
        children: [
    
          CustomSearchField(
            controller: _searchController,
            onChanged: controller.onSearch,
          ),

   
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
                        '${Applink.imageBaseUrl}/${imagePath.split('/').last}';

                    return GestureDetector(
                      onTap: () {
                        if (!isProduct) {
                          Get.to(() => ProductsScreen(
                                categoryId: item['id'],
                                categoryName: item['name'],
                                categoryImage: item['image'],
                              ));
                        } else {
                          print("منتج: ${item['name']}");
                        }
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(item['name']),
                          subtitle:
                              isProduct //the defernt btween the product and category is the price

                                  ? Text(
                                      'السعر: ${item['price']}') // this ? mean do and : mean else
                                  : const Text('تصنيف'),
                          leading: Image.network(
                            imageUrl,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) =>  //th errorbuilder is a function that is in image network
                                const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } 
              
              else {                                              //if the user doesnt search we display the catrgory
                //else if he doesnt search the category apear
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
            }),
          ),
        ],
      ),
    );
  }
}
