import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';

import 'package:get/get.dart';

/// ويدجت مخصص لعنصر الإعداد
class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color iconColor;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor = Colors.blue, // اللون الافتراضي
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