

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/CartScreen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/EmptyFavoritesScreen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/Favourite_Screen.dart';
// import 'package:flutter_application_7/core/constant/color.dart';
// import 'package:flutter_application_7/screen/acount.dart';
//  // تأكد من مسار ملف AccountScreen
// import 'package:flutter_application_7/wedjet/home/customdrawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//       CategoryScreen(),
// FavouriteScreen(),    // المؤقتة

// CartScreen(),
//     AccountScreen(), 
    

// // شاشة الحساب
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         backgroundColor: Colors.pink,
//         animationDuration: Duration(milliseconds: 200),
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           Icon(Icons.home),
//           Icon(Icons.favorite),
//           Icon(Icons.shopping_cart),
//           Icon(Icons.person),
        
//         ],
//       ),
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//     );
//   }
// }













import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/CartScreen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/Favourite_Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/screen/acount.dart';


// تأكد من مسار ملف AccountScreen
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [

    const CategoryScreen(),
    FavouriteScreen(),
    CartScreen(),
   AccountScreen(),

  ];

  // final List<String> _titles = [
  //   'Home',
  //   'Favourites',
  //   'Cart',
  //   'Account',
  // ];

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(

      body: _screens[_currentIndex],
      // appBarTitle: _titles[_currentIndex],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}








// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/CartScreen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/EmptyFavoritesScreen.dart';
// import 'package:flutter_application_7/Features/Product/presentation/view/Favourite_Screen.dart';
// import 'package:flutter_application_7/core/constant/color.dart';
// import 'package:flutter_application_7/screen/acount.dart';
//  // تأكد من مسار ملف AccountScreen
// import 'package:flutter_application_7/wedjet/home/customdrawer.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//       CategoryScreen(),
// FavouriteScreen(),    // المؤقتة

// CartScreen(),
//     AccountScreen(), 
    

// // شاشة الحساب
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       bottomNavigationBar: CurvedNavigationBar(
//         index: _currentIndex,
//         backgroundColor: Colors.pink,
//         animationDuration: Duration(milliseconds: 200),
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           Icon(Icons.home),
//           Icon(Icons.favorite),
//           Icon(Icons.shopping_cart),
//           Icon(Icons.person),
        
//         ],
//       ),
//       body: _screens[_currentIndex],
//     );
//   }
// }