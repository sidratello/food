import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(  fontWeight: FontWeight.bold, ),),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      
    );
  }

  // هذا السطر مهم ليعرف Scaffold كم ارتفاع الـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
