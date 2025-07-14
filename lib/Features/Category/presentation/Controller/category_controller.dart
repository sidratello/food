import 'package:flutter_application_7/Features/Category/data/Serveses/category_service.dart';
import 'package:flutter_application_7/Features/Category/data/Serveses/search_for_category_service.dart';
import 'package:get/get.dart';
import 'package:flutter_application_7/Features/Category/data/models/category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController extends GetxController {
  final CategoryServices _categoryServices = CategoryServices();

  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  var isSearching = false.obs; //is the user search now ?
  var searchResults = [].obs;   //search result     obx mean when the value of it change the ui ba refrach otomateckaly

  String? token;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      print('Using token: $token');

      var fetchedCategories = await _categoryServices.getCategory(token ?? '');
      categories.value = fetchedCategories;
    } catch (e) {
      print('Error fetching categories: $e');
      categories.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void onSearch(String keyword) async {
    if (keyword.trim().isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }

    isSearching.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';

      final response =
          await SearchForCategory().searchaboutCategory(keyword, token);

          //response return data that we search about 

      print("🔍 رد السيرفر: $response");

      final data = response['Search Results'] ?? [];
      searchResults.value = data;
    } catch (e) {
      print("❌ Search Error: $e");
      searchResults.clear();
    }
  }



  
}
