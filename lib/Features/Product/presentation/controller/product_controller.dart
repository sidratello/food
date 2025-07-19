
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/Product/data/serveses/product_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
 var products = <ProductModel>[].obs;
     var isLoading = false.obs;

   void fetchProducts(int categoryId, String token) async {
      try {
       isLoading.value = true;
       SharedPreferences prefs = await SharedPreferences.getInstance();
       token = prefs.getString('token') ?? '';

     var result = await _productService.getProductsByCategory(categoryId, token);
      products.value = result;

      print("عدد المنتجات: ${products.length}");
     } catch (e) {
      print("خطأ أثناء جلب المنتجات: $e");
      products.clear();
    } finally {
      isLoading.value = false;
     }
   }
  }
