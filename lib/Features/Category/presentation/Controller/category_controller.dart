import 'package:flutter_application_7/Features/Category/data/Serveses/category_service.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/Category/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController extends GetxController {
  final CategoryServices _categoryServices = CategoryServices();

  // قائمة الكاتيجوريز المحفوظة (قابلة للتغيير - observable)
  var categories = <CategoryModel>[].obs;

  // حالة تحميل البيانات
  var isLoading = false.obs;
 String? token;
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // دالة لجلب البيانات من السيرفر
  void fetchCategories() async {
    try {
      isLoading.value = true;
          SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print('Using token: $token');
      var fetchedCategories = await _categoryServices.getCategory(token?? '');
      categories.value = fetchedCategories;

    } catch (e) {
      print('Error fetching categories: $e');
      categories.clear(); // مسح القائمة لو حصل خطأ
      // هنا ممكن تعرض رسالة خطأ للمستخدم لو تحب
    } finally {
      isLoading.value = false;
    }
  }
  
}


