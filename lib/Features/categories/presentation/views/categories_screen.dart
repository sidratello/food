import 'package:flutter/material.dart';

import '../../../../data/model/category_model.dart';
import '../../data/categories_service.dart';
import '../widgets/custom_appBar_category.dart';
import '../widgets/custom_textfieldSearch_category.dart';
import '../widgets/expanded_category.dart';

class CategoryScreen extends StatefulWidget {


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<CategoryModel> allCategoriesFromApi = []; // ✅ التصنيفات القادمة من السيرفر
  List<CategoryModel> filteredCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCategory(),
    body: FutureBuilder(
        future: getCategories(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text('Error fetching data.'));
          } else {
            // ✅ تحويل البيانات إلى قائمة من CategoryModel
            allCategoriesFromApi = List.generate(snapshot.data.length, (index) {
              return CategoryModel.fromMap(snapshot.data[index]);
            });

            // ✅ إذا ما تم عمل تصفية سابقًا، عرض كل العناصر
            if (filteredCategories.isEmpty && _searchController.text.isEmpty) {
              filteredCategories = List.from(allCategoriesFromApi);
            }

            return Column(
              children: [
                CustomTextfieldsearchCategory(),
                ExpandedCategory(),
              ],
            );
          }
        },
      ),
    );
  }
}
