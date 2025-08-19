



import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Cart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Delet_from_favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CUstomSarch.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_For_DetalsProduct.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/productCard_wedjet.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';

import '../wedjet/Custom_Buttom_for_Detals.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
 final Add_TO_Cart_Controller cartController = Get.put(Add_TO_Cart_Controller());
  final TextEditingController _noteController = TextEditingController();
Add_TO_Favourite_Controller favController=Get.put(Add_TO_Favourite_Controller());
int _quantity = 1;
  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
       
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: ProductCard(
                    product: product,
                    onTap: null,
                    showName: false,
                    showPrice: false,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                ),
       Positioned(
  top: 40,
  right: 16,
  child: Obx(() => IconButton(
    icon: Icon(
     favController.isFavourite(product.id)
          ? Icons.favorite
          : Icons.favorite_border,
      color: Colors.red,
    ),
    onPressed: () async {
      favController.toggleFavourite(product.id);
      
//when the user click on the love icon it change the sate of it 
    },
  )),
),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
            
        
                 CustomText_For_DetalsProduct(text:product.name,
                           fontSize: 20,
                      fontWeight: FontWeight.bold,),
        
        
        
                  const SizedBox(height: 6),
        
        
                CustomText_For_DetalsProduct(fontSize: 16, color: Colors.grey, text:product.details ,),
                  
                  const SizedBox(height: 8),
                  
                CustomText_For_DetalsProduct(fontSize: 22, color:AppColor.pink , text: '${product.price} ل.س' ,             fontWeight: FontWeight.bold,),
        
                  const SizedBox(height: 20),
        
                   Text(
                    "ملاحظات إضافية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 8),
      CustomTextField(
  controller: _noteController,
  hintText: '.. . أخبرنا بملاحظاتك',
  maxLines: 2,
),

        
                  const SizedBox(height: 16),
        
          
        
        
                  const SizedBox(height: 24),
        
             
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                      ),
                      Text(
                     '$_quantity',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                    setState(() {
          if (_quantity > 1) _quantity--;
        });
                        },
                      ),
                    ],
                  ),
        
                  const SizedBox(height: 16),
        
                  //  زر الإضافة للسلة
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:CustomButtonForDetals(text: 'Add product to card', onPressed: () { 


    cartController.toggleCart(
      product.id,
      _quantity,
      _noteController.text.trim(),
    );

                     },), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}











