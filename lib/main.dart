import 'package:flutter/material.dart';
import 'package:flutter_application_7/screen/acount.dart';
import 'package:flutter_application_7/screen/departmentscreen.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:flutter_application_7/screen/onbording.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/screen/srction.dart';
import 'package:flutter_application_7/wedjet/home/appbar.dart';
import 'package:flutter_application_7/wedjet/login.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
   initialRoute: "/home",
        getPages: [
        
        GetPage(name: "/onbording", page: () => onbording(),),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/sinup", page: () => Sinup()),
        GetPage(name: "/home", page: () => HomePage()),
          GetPage(name: "/home2", page: () => AccountScreen()),
 GetPage(name: "/home3", page: () => HomeScreen()),

          
    
      ],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
