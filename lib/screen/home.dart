import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/CartScreen.dart';
import 'package:flutter_application_7/Features/Product/presentation/view/Favourite_Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/screen/acount.dart';

// تأكد من مسار ملف AccountScreen
import '../Features/Category/presentation/views/category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CategoryScreen(),
    Center(child: Text("Home")), // المؤقتة
    FavouriteScreen(),
    CartScreen(),
    // AccountScreen(), // شاشة الحساب
  ];

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
