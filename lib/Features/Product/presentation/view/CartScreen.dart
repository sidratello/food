
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Delet_From_Cart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/cusom_order_buttom.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';

import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';

class CartScreen extends StatelessWidget {
  final ShowCartController controller = Get.put(ShowCartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      showAppBar: true,
      appBarTitle: 'Cart',
   showNavBar: false,
      body:       
       Obx(
        
        () {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.CartList.isEmpty) {
      
          return Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 2 * pi),
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              builder: (context, angle, child) {
                return Transform.rotate(
                  angle: sin(angle) * 0.1, // حركة خفيفة يمين ويسار
                  child: child,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                   'assets/images/emtycartImage.png' ,
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Your cart is empty",
                    style: TextStyle(color: Colors.pink, fontSize: 20),
                  ),
                  const Text(
                    "Add something to make me happy :)",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }

   
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.CartList.length,
                itemBuilder: (context, index) {
                  final product = controller.CartList[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                            Text("Note: ${product.note}"),
                          Text("Quantity: ${product.quantity}"),
                          Text("Total Price: ${product.totalPrice} ل.س"),
                        ],
                      ),
                      leading: 
                           Image.network(
                             "http://192.168.1.10:8000/${product.image.split('/').last}",
                              width: 50,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            ),
                            trailing: IconButton(
  icon: const Icon(Icons.delete, color: Colors.red),
  onPressed: () {
    final deleteController = Get.put(DeleteCartController());
    deleteController.deleteFromCart(product.productId);
  },
),

                  
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[100],
          child:Text(

              "Total: ${controller.total.value} ل.س",

          ),
              
            
            ),
const OrderTypeButton(),




          ],
        );
      }),
    );
  }
}










