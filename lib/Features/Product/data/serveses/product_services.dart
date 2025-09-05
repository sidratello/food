// import 'dart:convert';
// import 'package:flutter_application_7/helper/AppLink.dart';
// import 'package:flutter_application_7/helper/api.dart';
// import 'package:http/http.dart' as http;
// import '../models/product_model.dart';

// class ProductService {
//   Future<List<ProductModel>> getProductsByCategory(int categoryId, String token) async {
  


//         var response = await Api().get(url: Applink.productByCategory(categoryId), token: token);

//    print("Response: $response");
//  if (response is Map && response['stutuse'] == "success") {
    
//         List<dynamic> productsJson = response['products'];
//       List<ProductModel> productList = [];
// for (int i = 0; i < productsJson.length; i++) {
//   productList.add(ProductModel.fromJson(productsJson[i]));
// }
// return productList;

//       } else {
//         throw Exception('Failed to load products');
//       }
//     } 
  
// }


import 'dart:convert';
import 'package:flutter_application_7/Features/Product/data/model/product_model.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';
import 'package:http/http.dart' as http;


class ProductService {

Future<List<ProductModel>> getProductsByCategory(int categoryId, String token) async {

var response  =await  Api().get(url: Applink.productCategory(categoryId), token: token);

if (response is Map && response['stutuse'] == "success") {

    
        List<dynamic> productsJson = response['products'];
      List<ProductModel> productList = [];
for (int i = 0; i < productsJson.length; i++) {
  productList.add(ProductModel.fromJson(productsJson[i]));
}
return productList;

      } 

  

else {
        throw Exception('Failed to load products');
      }

 }
}