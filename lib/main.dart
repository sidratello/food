// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/UserTypeChoiceScreen.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/loginDriver.dart';
// import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
// import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
// import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
// import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
// import 'package:flutter_application_7/core/constant/color.dart';
// import 'package:flutter_application_7/firebase_options.dart';
// import 'package:flutter_application_7/screen/acount.dart';

// import 'package:flutter_application_7/screen/home.dart';


// import 'package:flutter_application_7/screen/onbording.dart';


// import 'package:flutter_application_7/wedjet/googlemap/customgooglemap.dart';

// import 'package:get/get.dart';



//   void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//    Get.put(Add_TO_Favourite_Controller(), permanent: true);
//   Get.put(ShowFavouriteController(), permanent: true);
//    Get.put(ShowCartController(), permanent: true);
//   runApp(const MyApp());
// getFCMToken();


// }

// void getFCMToken() async {

// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});


//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//    initialRoute:"/UserType",
//    theme: ThemeData(
//     fontFamily: "fonts",
//     textTheme: const TextTheme(
//       headline1: TextStyle(
//         fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.black,
//                     ),
//   bodyText1:const TextStyle(height: 2,
//   color: AppColor.grey,

//   ),
//     ),



//    ),
//         getPages: [

//         GetPage(name: "/UserType", page: () => UserTypeChoiceScreen(),),
//         GetPage(name: "/login", page: () => login()),
//          GetPage(name: "/loginDriver", page: () => loginDriver()),
//         GetPage(name: "/sinup", page: () => Sinup()),
//         GetPage(name: "/home", page: () => HomePage()),
//           GetPage(name: "/home2", page: () => AccountScreen()),
// //  GetPage(name: "/home3", page: () => HomeScreen()),
// //  GetPage(name: "/varyfay", page: () => VerifyCodeScreen()),
//            GetPage(name: "/Map", page: () =>  CustomGoogleMap(), ),
//                   GetPage(name: "/category", page: () =>  CategoryScreen(), ),
//                    GetPage(name: "/google", page: () =>  CustomGoogleMap(), ),
//             //  GetPage(name: "/sham", page: () =>  HomeScreen(), ),

//       ],// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/Signup_screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/UserTypeChoiceScreen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/splashscreeen.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Add_To_Favourite_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/ShowCart_Controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/controller/Show_Favourite_Controller.dart';
import 'package:flutter_application_7/core/constant/color.dart';

import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/wedjet/googlemap/customgooglemap.dart';
import 'package:get/get.dart';


import 'screen/onbording.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Get.put(Add_TO_Favourite_Controller(), permanent: true);
  Get.put(ShowFavouriteController(), permanent: true);
  Get.put(ShowCartController(), permanent: true);
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
      initialRoute: "/reservation",
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
         GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(
          name: "/onbording",
          page: () => onbording(),
        ),
        GetPage(name: "/login", page: () => login()),
        GetPage(name: "/sinup", page: () => Sinup()),
        GetPage(name: "/home", page: () => HomePage()),
        // GetPage(name: "/home2", page: () => AccountScreen()),
    GetPage(name: "/Map", page: () =>  CustomGoogleMap(), ),
    GetPage(name: "/category", page: () =>  CategoryScreen(), ),
    GetPage(name: "/google", page: () =>  CustomGoogleMap(), ),
        GetPage(name: "/reservation", page: () => ReservationScreen()),
        GetPage(name: "/showreservation", page: () => ShowReservationScreen()),
                GetPage(name: "/usertype", page: () => UserTypeChoiceScreen()),


      ],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
