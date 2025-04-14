
  
class SweetModel {
  final String name;
  final double price;
  final int rating;
  final String image;

  SweetModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory SweetModel.fromJson(Map<String, dynamic> json) {
    return SweetModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      rating: json['rating'],
      image: json['image'],
    );
  }
}