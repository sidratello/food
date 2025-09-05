import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// صفحاتك الحالية
import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/UserTypeChoiceScreen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/scsufful_page.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/splashscreeen.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/wedjet/googlemap/customgooglemap.dart';
import 'package:flutter_application_7/screen/home.dart';

// كونترولراتك (لو تستخدمها)
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/core/constant/theme_controller.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/fill_muhfaza_controller.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/controller/show_mufaza.dart';

import 'package:flutter_application_7/core/constant/color.dart';
import 'screen/onbording.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // جهّز SharedPreferences لتحديد initialRoute
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  final role  = prefs.getString('role'); // 'user' or 'driver' أو null

  // منطق التوجيه:
  // - فيه token  -> على طول Home
  // - مافي token و role = null -> أول مرّة -> UserType
  // - مافي token و role محفوظ -> رجّعه للتسجيل/الدخول
  String initialRoute;
  if (token.isNotEmpty) {
    initialRoute = '/home';
  } else if (role == null) {
    initialRoute = '/usertype';
  } else {
    // لو اختر نوعه قبل كذا لكنه لسه ما سجّل
    initialRoute = '/sinup'; // أو '/login' حسب تدفقك
  }

  // حط كونترولراتك (يفضل بدون permanent للي مرتبط بالمستخدم)
  Get.put(ThemeController(), permanent: true);

  // مرتبطين بالمستخدم—خلّهم بدون permanent
  Get.put(Add_TO_Favourite_Controller());
  Get.put(ShowFavouriteController());
  Get.put(ShowCartController());
  Get.put(AddToMuhfazaController());
  Get.put(ShowMufazaController());

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      themeMode: theme.themeMode.value,
      theme: ThemeData(
        fontFamily: "fonts",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          bodyLarge: TextStyle(
            height: 2,
            color: AppColor.grey,
          ),
        ),
      ),
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: "/onbording", page: () => onbording()),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/sinup", page: () => Sinup()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/Map", page: () => CustomGoogleMap()),
        GetPage(name: "/category", page: () => CategoryScreen()),
        GetPage(name: "/google", page: () => CustomGoogleMap()),
        GetPage(name: "/reservation", page: () => ReservationScreen()),
        GetPage(name: "/showreservation", page: () => ShowReservationScreen()),
        GetPage(name: "/usertype", page: () => UserTypeChoiceScreen()),
        GetPage(name: "/sucess", page: () => PasswordChangedSuccessScreen()),
      ],
    );
  }
}
