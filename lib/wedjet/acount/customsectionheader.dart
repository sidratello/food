import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool showTrailing; // <-- new optional parameter

  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.showTrailing = false, // default: don't show the trailing icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: AppColor.pink),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.pink,
          ),
        ),
        trailing: showTrailing ? Icon(Icons.chevron_right) : null, // 👈 conditional
        onTap: () {
          // Add action here
        },
      ),
    );
  }
}
