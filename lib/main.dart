import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/firebase_options.dart';
import 'package:flutter_application_7/screen/acount.dart';
import 'package:flutter_application_7/screen/departmentscreen.dart';
import 'package:flutter_application_7/screen/googleMap.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:flutter_application_7/screen/onbording.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/screen/srction.dart';
import 'package:flutter_application_7/screen/varyfayscreen.dart';
import 'package:flutter_application_7/wedjet/googlemap/customgooglemap.dart';
import 'package:flutter_application_7/wedjet/home/appbar.dart';
import 'package:flutter_application_7/wedjet/login.dart';
import 'package:get/get.dart';
  import 'package:firebase_messaging/firebase_messaging.dart';


  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
getFCMToken();


}

void getFCMToken() async {

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
   initialRoute:"/sinup",
   theme: ThemeData(
    fontFamily: "fonts",
    textTheme: const TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.black,
                    ),
  bodyText1:const TextStyle(height: 2,
  color: AppColor.grey,

  ),
    ),

  

   ),
        getPages: [
        
        GetPage(name: "/onbording", page: () => onbording(),),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/sinup", page: () => Sinup()),
        GetPage(name: "/home", page: () => HomePage()),
          GetPage(name: "/home2", page: () => AccountScreen()),
 GetPage(name: "/home3", page: () => HomeScreen()),
//  GetPage(name: "/varyfay", page: () => VerifyCodeScreen()),
           GetPage(name: "/Map", page: () =>  CustomGoogleMap(), ),
    
      ],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





