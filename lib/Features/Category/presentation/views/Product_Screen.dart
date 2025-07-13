import 'package:flutter/material.dart';

import 'package:flutter_application_7/Features/Category/presentation/Controller/Product_controller.dart';
import 'package:get/get.dart';



class ProductsScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  ProductsScreen({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
  
   productController.fetchProducts(categoryId, "");
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.transparent, // لو تحب يكون شفاف فوق الصورة
    elevation: 0, // إزالة الظل
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        Get.back(); // ترجع للشاشة السابقة باستخدام GetX
      },
    ),

  ),
  extendBodyBehindAppBar: true,
    
    
     body: Column(
        children: [
          // صورة التصنيف في الأعلى
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("http://192.168.1.10:8000/${categoryImage.split('/').last}"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              categoryName,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 5, color: Colors.black)],
              ),
            ),
          ),

      
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (productController.products.isEmpty) {
                return Center(child: Text('لا توجد منتجات'));
              }

              return GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: productController.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = productController.products[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            "http://192.168.1.10:8000/${product.image.split('/').last}",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Icon(Icons.broken_image));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("${product.price} ل.س"),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
         ],
       ),
   );
 }
  
}
