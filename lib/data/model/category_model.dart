// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String image;
  int id;
  String title;
  String body;
  CategoryModel({required this.id, required this.title, required this.body,required this.image});

  static fromMap(Map<String, dynamic> map) {
    return CategoryModel(id: map['id'], title: map['title'], body: map['body'], image: map['image']);
  }

  toMap() {
    return {'id': id, 'title': title, 'body': body, 'image': image}  ;
  }
}
