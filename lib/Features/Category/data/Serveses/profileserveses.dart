import 'package:flutter_application_7/Features/Category/data/models/profilemodel.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class ProfileService {
  Future<ProfileModel> fetchProfile(String token) async {
    final res = await Api().get(url: Applink.profile, token: token);

    if (res is! Map<String, dynamic>) {
      throw 'استجابة غير متوقعة من الخادم';
    }

    // نأخذ جزء الـ data من الـ response
    final data = res['data'];
    if (data is! Map<String, dynamic>) {
      throw 'بيانات الملف الشخصي غير صالحة';
    }

    // نرجع ProfileModel من الـ data
    return ProfileModel.fromResponse(res);
  }
}
