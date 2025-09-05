import 'package:get/get.dart';

class ProfileModel {
  final String? name;
  final String? phone;

  ProfileModel({this.name, this.phone});

  factory ProfileModel.fromResponse(Map<String, dynamic> json) {
    // your response shape: { "message": "...", "data": { "name": "...", "phone": "...", ... } }
    final data = json['data'] as Map<String, dynamic>? ?? {};
    return ProfileModel(
      name: data['name'] as String?,
      phone: data['phone'] as String?,
    );
  }
}