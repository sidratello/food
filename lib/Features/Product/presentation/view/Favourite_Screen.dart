






import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Delet_from_favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';

import 'package:flutter_application_7/Features/Product/presentation/view/EmptyFavoritesScreen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_detals.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_for_Emptyfavourite%20Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/customlisttileforfavourite.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {

final ShowFavouriteController favController = Get.find<ShowFavouriteController>();
    FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (favController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (favController.favouriteList.isEmpty) {
        return const EmptyFavoritesScreen(); 
      }

  
      return CustomScaffold(
        showAppBar: true,
        appBarTitle: 'favourite',
        showNavBar: false,
         
        body: ListView.builder(
          itemCount: favController.favouriteList.length,
          itemBuilder: (context, index) {
     final product = favController.favouriteList[index];
            final imageUrl =
                  // "https://res.mustafafares.com/${product.image.split('/').last}";
    // "http://192.168.1.2:8000/${product.image.split('/').last}";
    "http://192.168.43.222:8000/${product.image.split('/').last}";
            return CustomListTile(
              title: product.name,
              subtitle: product.price,
              imageUrl: imageUrl,
              onTap: () {
                Get.to(() => ProductDetailsScreen(product: product));
              },
              onDelete: () {
                final deleteController = Get.put(DeleteFavouriteController());
                deleteController.deleteFromFavourite(product.id);
              },
            );
          },
        ),
      );
    });
        
    
  }
}
