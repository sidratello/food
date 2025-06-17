import 'package:flutter/material.dart';

class AppBarCategory extends StatelessWidget implements PreferredSizeWidget {
  final String title; // العنوان المتغير

  const AppBarCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title), // استخدم المتغير
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
