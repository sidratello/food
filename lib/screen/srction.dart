// import 'package:flutter/material.dart';

// // ويدجت العنوان لكل قسم
// class SectionHeader extends StatelessWidget {
//   final String title;  // اجعلها غير قابلة لأن تكون null

//   const SectionHeader({Key? key, required this.title, required IconData icon, required bool showTrailing}) : super(key: key); // استخدم required

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[200],
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Text(
//         title,  // الآن يمكن استخدامها مباشرة لأنها ليست null
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }

// // الشاشة التي تحتوي على القائمة المقسمة
// class SectionedListScreen extends StatelessWidget {
//   const SectionedListScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sectioned List')),
//       body: ListView(
//         children: const [
//           SectionHeader(title: 'Fruits'),
//           ListTile(title: Text('Apple')),
//           ListTile(title: Text('Banana')),
//           SectionHeader(title: 'Vegetables'),
//           ListTile(title: Text('Carrot')),
//           ListTile(title: Text('Broccoli')),
//         ],
//       ),
//     );
//   }
// }



