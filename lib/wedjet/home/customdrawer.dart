import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      children: [
     ClipOval(
      child: Image.network('https://www.pikpng.com/pngl/b/183-1834788_person-png-clipart.png',
      width:90,
      height: 90,),

     )
      ],
      
      ),
    );
  }
}