import 'package:flutter_application_7/Features/mufaza/data/modeles/Walletmodel.dart';
import 'package:flutter_application_7/helper/AppLink.dart';
import 'package:flutter_application_7/helper/api.dart';


class ShowMufazaServeses {
  /// ترجع معلومات المحفظة (الرصيد + العملة)
  Future<WalletInfo> showMufaza(String token) async {
    final response = await Api().get(url: Applink.showmuhfaza, token: token);

    if (response is Map<String, dynamic>) {
      return WalletInfo.fromMap(response);
    }
    // أحيانًا السيرفر ممكن يرجّع String أو List بالخطأ
    throw 'استجابة غير متوقعة من الخادم';
  }
}
