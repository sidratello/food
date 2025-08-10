import 'package:flutter/material.dart';

class OrderTypeButton extends StatelessWidget {
  const OrderTypeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.store),
                    title: const Text("طلب داخلي (داخل المطعم)"),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم اختيار الطلب الداخلي")),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delivery_dining),
                    title: const Text("طلب خارجي (خارج المطعم)"),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم اختيار الطلب الخارجي")),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          "Order Now",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
