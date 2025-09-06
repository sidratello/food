import 'package:flutter/material.dart';

Future<void> showCustomDialog({
    required BuildContext context,
    required String message,
    String cancelText = "إلغاء",
    String confirmText = "موافق",
    required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: Text(confirmText),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
          ),
        ],
      );
    },
  );
}
