import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/screen/acount.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/wedjet/googlemap/customgooglemap.dart';
import 'package:get/get.dart';

import 'Features/Category/presentation/views/category_screen.dart';
import 'core/constant/color.dart';
import 'screen/onbording.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
  // getFCMToken();
}

void getFCMToken() async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/sinup",
      theme: ThemeData(
        fontFamily: "fonts",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.black,
          ),
          bodyLarge: const TextStyle(
            height: 2,
            color: AppColor.grey,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: "/onbording",
          page: () => onbording(),
        ),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/sinup", page: () => Sinup()),
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/home2", page: () => AccountScreen()),
    GetPage(name: "/Map", page: () =>  CustomGoogleMap(), ),
    GetPage(name: "/category", page: () =>  CategoryScreen(), ),
    GetPage(name: "/google", page: () =>  CustomGoogleMap(), ),
        GetPage(name: "/reservation", page: () => ReservationScreen()),
        GetPage(name: "/showreservation", page: () => ShowReservationScreen()),

      ],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
