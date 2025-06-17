import 'package:flutter/material.dart';

import '../../../categories/presentation/views/categories_screen.dart';

class CustomAppBarProducts extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBarProducts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  CategoryScreen()),
          );
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
