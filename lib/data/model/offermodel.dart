class OfferModel {
  final String title;
  final String description;
  final String image;

  OfferModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory OfferModel.fromJson( jsonData) {
    return OfferModel(
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
  }
}
