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





  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      price: json['price']?.toString() ?? '',
      details: json['details']?.toString() ?? '',
    );
  }

}
