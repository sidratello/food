import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;

  const CustomDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = Colors.pink, // default color if not passed
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      onTap: onTap,
    );
  }
}
