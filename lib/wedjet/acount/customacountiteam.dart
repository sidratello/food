import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap; // ⬅️ استدعاء عند الضغط

  const AccountItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap, // ⬅️ نفذ الدالة
    );
  }
}
