// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Category/presentation/Controller/category_controller.dart';
// import 'package:get/get.dart';



// class CategoryScreen extends StatelessWidget {
//   final CategoryController controller = Get.put(CategoryController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Categories"),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }

//         return GridView.builder(
//           padding: EdgeInsets.all(10),
//           itemCount: controller.categories.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             final category = controller.categories[index];
  
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               clipBehavior: Clip.hardEdge,
//               child: Stack(
//                 children: [
//               Image.network(
//   "http://192.168.1.7:8000/storage/${category.image.replaceFirst('public/', '')}",
//   fit: BoxFit.cover,
//   width: double.infinity,
//   height: double.infinity,
//   errorBuilder: (context, error, stackTrace) {
//     return Center(child: Icon(Icons.broken_image));
//   },
// ),

//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       color: Colors.black54,
//                       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                       child: Text(
//                         category.name,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Category/presentation/wedjets/CustomSearchTextField.dart';
// import 'package:flutter_application_7/Features/Category/presentation/wedjets/appbarCategory.dart';
// import 'package:flutter_application_7/Features/Category/presentation/wedjets/customCategoryCard.dart';
// import 'package:get/get.dart';
// import '../controller/category_controller.dart';


// class CategoryScreen extends StatelessWidget {
//   final CategoryController controller = Get.put(CategoryController());

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar:CustomAppBar(title: 'Menu',),


//       body:
//        Column(
//          children: [
  
//       // ✅ صندوق البحث
   
//         CustomSearchField(),
      
  
//            Expanded(
//              child: Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               }
             
//               return ListView.builder(
//                 padding: const EdgeInsets.all(16),
//                 itemCount: controller.categories.length,
//                 itemBuilder: (context, index) {
//                   final category = controller.categories[index];
//                   return CategoryCard(category: category);
//                 },
//               );
//                    }),
//            ),
//          ],
//        ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/data/Serveses/search_for_category_service.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/Category/data/models/category_model.dart';
import 'package:flutter_application_7/Features/Category/presentation/controller/category_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/Product_Screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/CustomSearchTextField.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/appbarCategory.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/customCategoryCard.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController controller = Get.put(CategoryController());
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> _searchResults = [];
  bool _isSearching = false;

  void _onSearch(String keyword) async {
    if (keyword.trim().isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults.clear();
      });
      return;
    }

    setState(() => _isSearching = true);

    try {
  
    // ✅ 1. جلب التوكن
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    // ✅ 2. إرسال الطلب مع التوكن
    final response =
        await SearchForCategory().searchaboutCategory(keyword, token);

    print("🔍 رد السيرفر: $response");

    final data = response['Search Results'] ?? [];

      setState(() {
        _searchResults = data;
      });

      print("📦 النتائج: $_searchResults");
    } catch (e) {
      print("❌ Search Error: $e");
      setState(() => _searchResults = []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Menu'),
      body: Column(
        children: [
          // ✅ صندوق البحث
          CustomSearchField(
            controller: _searchController,
            onChanged: _onSearch,
          ),

          // ✅ النتائج أو التصنيفات
          Expanded(
            child: _isSearching
                ? _searchResults.isEmpty
                    ? const Center(child: Text('لا توجد نتائج'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final item = _searchResults[index];
                          final isProduct = item.containsKey('price');

                          return GestureDetector(
                            onTap: () {
                              if (!isProduct) {
                                // إذا كانت النتيجة تصنيف
                                Get.to(() => ProductsScreen(
                                      categoryId: item['id'],
                                      categoryName: item['name'],
                                      categoryImage: item['image'],
                                    ));
                              } else {
                                // إذا كانت منتج، لاحقًا ممكن تفتح تفاصيل
                                print("✅ منتج: ${item['name']}");
                              }
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(item['name']),
                                subtitle: isProduct
                                    ? Text('السعر: ${item['price']}')
                                    : const Text('تصنيف'),
                                leading: Image.network(
                                  'http://192.168.1.10:8000/${item['image'].toString().split('/').last}',
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                : Obx(() {
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
                  }),
          ),
        ],
      ),
    );
  }
}
