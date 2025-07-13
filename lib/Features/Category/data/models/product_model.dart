import 'dart:convert';

class ProductModel {
  final int id;
  final int categoryId;
  final String image;
  final String name;
  final String price;
  final String details;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.name,
    required this.price,
    required this.details,
  });

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     id: json['id'],
  //     categoryId: json['category_id'],
  //     image: json['image'],
  //     name: json['name'],
  //     price: json['price'],
  //     details: json['details'],
  //   );
  // }

  

factory ProductModel.fromJson(Map<String,dynamic> json){

return ProductModel(
 id: json['id'],
      categoryId: json['category_id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      details: json['details'],);


}

}
