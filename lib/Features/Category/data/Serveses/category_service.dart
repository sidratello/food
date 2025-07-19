import 'package:flutter_application_7/Features/Category/data/models/category_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class CategoryServices { 
  Future<List<CategoryModel>> getCategory(String token) async {


      print('Using token: $token'); 
    var response = await Api().get(url: Applink.Category, token: token);
print('Response from API: $response');

    // نتأكد أن response يحتوي على statusCode = 200
    if (response is Map && response['stutuse'] == "success") {
       List<dynamic> data = response['categories'] ?? [];// أو حسب هيكلة البيانات من API

      List<CategoryModel> categoryList = [];
      for (int i = 0; i < data.length; i++) {
        categoryList.add(CategoryModel.fromJson(data[i]));
      }

      return categoryList;
    } else {
      // يمكنك رفع استثناء أو إعادة قائمة فارغة أو أي معالجة أخرى
      throw Exception('Failed to load categories or invalid response');
    }
  }
}
