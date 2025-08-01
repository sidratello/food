import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/product_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_detals.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/productCard_wedjet.dart';
import 'package:flutter_application_7/helper/AppLink.dart';

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
        backgroundColor: Colors.transparent, 
        elevation: 0,          // إزالة الظل
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();      // ترجع للشاشة السابقة باستخدام GetX
          },
        ),
      ),
      extendBodyBehindAppBar: true, //AppBar  الصورة خلف الـ
      body: Column(
        children: [
       
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(

                image: NetworkImage("http://192.168.1.6:8000/${categoryImage.split('/').last}"),


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
                  return ProductCard(
                    product: product,
                    onTap: () {
                     
                      Get.to(() => ProductDetailsScreen(product: product));
                    },
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










