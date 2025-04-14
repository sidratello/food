import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String title;

  const AccountItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Add action here
      },
    );
  }
}