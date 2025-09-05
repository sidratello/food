






import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';

import 'package:flutter_application_7/Features/Product/presentation/view/EmptyFavoritesScreen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/product_detals.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_for_Emptyfavourite%20Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  final ShowFavouriteController favController =
      Get.put(ShowFavouriteController());

    FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (favController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (favController.favouriteList.isEmpty) {
        return const EmptyFavoritesScreen(); // شاشة فارغة إذا لا توجد مفضلات
      }

      // return Scaffold(
      //   appBar: AppBar(title: const Text("المفضلة")),
      return CustomScaffold(
        showAppBar: true,
        appBarTitle: 'المفضلة',
        showNavBar: false,
         
        body: ListView.builder(
          itemCount: favController.favouriteList.length,
          itemBuilder: (context, index) {
            final product = favController.favouriteList[index];
            return ListTile(
              onTap: () {
           
                Get.to(() => ProductDetailsScreen(product: product));
              },
              leading: Image.network(
                  "http://192.168.1.6:8000/${product.image.split('/').last}",
                  width: 60,
                  fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text(product.price),
            );
          },
        ),
      );
    });
  }
}
