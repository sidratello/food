import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/data/models/category_model.dart';

import 'package:flutter_application_7/Features/Product/presentation/view/product_Screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // عند الضغط ننتقل لشاشة المنتجات مع تمرير بيانات التصنيف
        Get.to(() => ProductsScreen(
              categoryId: category.id,
              categoryName: category.name,
              categoryImage: category.image,
            ));
      },
      child: Container(
        width: 200,
        height: 200,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            // نفترض أن رابط الصورة يحتوي فقط على اسم الملف
            image: NetworkImage(
              "http://192.168.1.10:8000/${category.image.split('/').last}",
            ),
            fit: BoxFit.cover,  // تغطي كامل الـ Container
          ),
        ),
        child: Container(
          // هذا الغطاء الأسود الشفاف لضمان وضوح النص فوق الصورة
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.3),
                      ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          alignment: Alignment.topLeft,
          child: Text(
            category.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
                ),
    );
  }
}
