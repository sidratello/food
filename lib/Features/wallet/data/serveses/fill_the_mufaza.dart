import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';

class FillTheMuhfazaService {
  Future<Map<String, dynamic>> addToMuhfaza({
    required String token,
    required String code,
  }) async {
    try {
      final res = await Api().post(
        url: Applink.fillmuhfaza,
        token: token,
        body: <String, dynamic>{
          'code': code,
        },
   
      );

      if (res is Map<String, dynamic>) {
        return res; // متوقع: { "message": "...", "balance": 1200180 }
      }
      return {'message': 'استجابة غير متوقعة من الخادم'};
    } catch (e) {
      // رسالة الخطأ للّوج فقط
      print('⚠️ addToMuhfaza error: $e');
      return {'message': 'حدث خطأ أثناء الاتصال بالخادم'};
    }
  }
}
