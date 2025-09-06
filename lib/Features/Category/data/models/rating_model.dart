class ratingmodel {
  final int id;
  final String name;
  final String image;
  final int averageRating;

  ratingmodel({
    required this.id,
    required this.name,
    required this.image,
    required this.averageRating,
  });

  factory ratingmodel.fromJson(Map<String, dynamic> json) {
    return ratingmodel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      averageRating: json['average_rating'] ?? 0,
    );
  }
}