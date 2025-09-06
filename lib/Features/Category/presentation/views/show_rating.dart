






import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/delet_rating_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/delet_rating_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/delet_rating_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/show_rating_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Delet_from_favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';

import 'package:flutter_application_7/Features/Product/presentation/view/EmptyFavoritesScreen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_detals.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_for_Emptyfavourite%20Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/customlisttileforfavourite.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

import 'package:get/get.dart';

import '../Controller/delet_rating_controller.dart';

class RatingScreen extends StatelessWidget {
  final ShowratingController ratController =
      Get.put(ShowratingController());

    RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
      if (ratController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (ratController.ratingList.isEmpty) {
        return const EmptyFavoritesScreen(); 
      }

      return CustomScaffold(
        showAppBar: true,
        appBarTitle: 'Rating Screen ⭐',
        showNavBar: false,
        showBackButton: true,
         
        body: ListView.builder(
          itemCount: ratController.ratingList.length,
          itemBuilder: (context, index) {
     final product = ratController.ratingList[index];
            final imageUrl =
                  //  "https://res.mustafafares.com/${product.image.split('/').last}";
     "http://192.168.1.2:8000/${product.image.split('/').last}";
        // "http://192.168.43.222:8000/${product.image.split('/').last}";
            return CustomListTile(
              title: product.name,
              subtitle: "rating: ${product.averageRating} stars",
              imageUrl: imageUrl,
              onTap: () {
          
              },
              onDelete: () {
                final deleteratController = Get.put(DeleteRatingeController());
                deleteratController.deleteFromrating(product.id);
              },
       
            );},
            ),
      );  

    },
    );
  }
}
