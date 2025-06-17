import 'package:flutter/material.dart';

class AppBarCategory extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back), color: Colors.black),
      title: const Text('Categories'),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // ضروري
}
