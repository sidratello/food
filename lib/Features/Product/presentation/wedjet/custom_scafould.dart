import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showAppBar;
  final bool showNavBar;
  final String? appBarTitle;
  final int currentIndex;
  final Function(int)? onTap;
  final Widget? floatingActionButton;
  final bool showBackButton; // زر الرجوع المخصص
  final VoidCallback? onBackPressed; // ما الذي يحدث عند الضغط عليه
  final Widget? drawer;

  const CustomScaffold({
    super.key,
    required this.body,
    this.showAppBar = true,
    this.showNavBar = true,
    this.appBarTitle,
    this.currentIndex = 0,
    this.onTap,
    this.floatingActionButton,
    this.showBackButton = false,
    this.onBackPressed,
    this.drawer
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
     appBar: showAppBar
    ? AppBar(
        automaticallyImplyLeading: false, //هذا يمنع Flutter من إظهار زر الرجوع تلقائيًا.
           toolbarHeight: 40, //مفيد لتقليل المساحة المستخدمة في أعلى الشاشة.
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackPressed ?? () => Navigator.pop(context), //if we have showBackButton it will excute else we go to breafuce screen
              )
            : null,
              title: Text(
                appBarTitle ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            )
          : null,



      body: body,
      bottomNavigationBar: showNavBar
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: AppColor.pink,
              animationDuration: const Duration(milliseconds: 200),
              onTap: onTap,
              items: const [
                Icon(Icons.home),
                Icon(Icons.favorite),
                Icon(Icons.shopping_cart),
                Icon(Icons.person),
              ],
            )
          : null,



      floatingActionButton: floatingActionButton,
    );
  }
}
