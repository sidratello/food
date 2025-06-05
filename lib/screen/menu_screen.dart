// import 'package:flutter/material.dart';

// import 'home_screen.dart';

// class FoodItem {
//   final String name;
//   final String image;
//   final double price;
//   bool isFavorite;

//   FoodItem({
//     required this.name,
//     required this.image,
//     required this.price,
//     this.isFavorite = false,
//   });
// }

// // ✅ لازم يكون عندك MenuScreen class أولاً
// class MenuScreen extends StatefulWidget {
//   const MenuScreen({super.key});

//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   final List<FoodItem> foodItems = [
//     FoodItem(name: "Bacon Burger", image: "assets/example.jpg", price: 150),
//     FoodItem(name: "Grilled Chicken", image: "assets/example.jpg", price: 120),
//     FoodItem(name: "Pizza Combo", image: "assets/example.jpg", price: 180),
//     FoodItem(name: "Salad", image: "assets/example.jpg", price: 100),
//   ];

//   final List<FoodItem> cart = [];
//   List<FoodItem> filteredFoodItems = [];

//   // ✅ تعريف وحيد
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     filteredFoodItems = List.from(foodItems); // عرض الكل في البداية
//   }

//   void _filterFoodItems(String query) {
//     final results = foodItems.where((item) {
//       return item.name.toLowerCase().contains(query.toLowerCase());
//     }).toList();

//     setState(() {
//       filteredFoodItems = results;
//     });
//   }

//   void addToCart(FoodItem item) {
//     setState(() {
//       cart.add(item);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('${item.name} added to cart')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomeScreen()),
//             );
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.black,
//         ),
//         title: const Text("Menu Items"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart),
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) => ListView(
//                   padding: const EdgeInsets.all(16),
//                   children: cart.map((item) => Text(item.name)).toList(),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: _filterFoodItems,
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: const Icon(Icons.search),
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.clear),
//                     onPressed: () {
//                       _searchController.clear();
//                       _filterFoodItems('');
//                     },
//                   ),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: filteredFoodItems.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 12,
//                   crossAxisSpacing: 12,
//                   childAspectRatio: 3 / 4,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = filteredFoodItems[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     elevation: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                             child: Image.asset(
//                               item.image,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Text(' ${item.price} p.c', style: const TextStyle(color: Colors.green)),
//                         ),
//                         ButtonBar(
//                           alignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                                 color: item.isFavorite ? Colors.red : Colors.grey,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   item.isFavorite = !item.isFavorite;
//                                 });
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.shopping_cart_outlined),
//                               onPressed: () => addToCart(item),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
