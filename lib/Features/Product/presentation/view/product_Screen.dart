import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_application_7/Features/Product/presentation/controller/product_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/add_rating_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_detals.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/productCard_wedjet.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/starewedjet.dart'; // StarSelector
import 'package:flutter_application_7/helper/AppLink.dart';

class ProductsScreen extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  final ProductController productController = Get.put(ProductController());
  final AddratingController addRatingController = Get.put(AddratingController());

  @override
  Widget build(BuildContext context) {
    // اجلب المنتجات لو القائمة فاضية وما في تحميل جارٍ
    if (!productController.isLoading.value &&
        productController.products.isEmpty) {
      productController.fetchProducts(categoryId, "");
    }

    // —— BottomSheet للتقييم ——
    Future<void> _openRateSheet(int productId) async {
      int chosen = addRatingController.getRating(productId); // ⭐ يبدأ من تقييمك السابق
      await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'قيّم هذا المنتج',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                StarSelector(
                  initial: chosen,
                  onChanged: (v) => chosen = v,
                ),
                const SizedBox(height: 8),
                Obx(() => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: addRatingController.isLoading.value
                            ? null
                            : () async {
                                if (chosen == 0) {
                                  ScaffoldMessenger.of(ctx).showSnackBar(
                                    const SnackBar(
                                        content: Text('اختر تقييماً')),
                                  );
                                  return;
                                }
                                final ok = await addRatingController
                                    .rateProduct(productId, chosen);
                                if (ok && ctx.mounted) {
                                  // (اختياري) إعادة الجلب إذا حبيت تحدّث المتوسط
                                  // await productController.fetchProducts(categoryId, "");
                                  Navigator.pop(ctx);
                                }
                              },
                        child: addRatingController.isLoading.value
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Text('إرسال'),
                      ),
                    )),
              ],
            ),
          );
        },
      );
    }

    // مسار صورة التصنيف
    final String headerImageUrl =
        // استخدم السيرفر الخاص بك؛ هنا مثال يعتمد imageBaseUrl
        // "https://res.mustafafares.com/${categoryImage.split('/').last}";
        "${Applink.imageBaseUrl}${categoryImage.split('/').last}";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: Get.back,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // هيدر بصورة التصنيف
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(headerImageUrl),
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

          // شبكة المنتجات
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (productController.products.isEmpty) {
                return const Center(child: Text('لا توجد منتجات'));
              }

              return GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: productController.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = productController.products[index];

                  return Stack(
                    children: [
                      ProductCard(
                        product: product,
                        onTap: () => Get.to(
                          () => ProductDetailsScreen(product: product),
                        ),
                      ),

                      // زر التقييم أعلى الكارد
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Obx(() {
                          final myRate =
                              addRatingController.getRating(product.id);
                          final alreadyRated = myRate > 0;

                          return InkWell(
                            onTap: () => _openRateSheet(product.id),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    alreadyRated
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    alreadyRated
                                        ? ' تقييم المنتج: $myRate'
                                        : 'قيّم',
                                    style:
                                        const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
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
