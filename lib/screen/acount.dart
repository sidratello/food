// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/core/constant/color.dart';
// import 'package:flutter_application_7/screen/srction.dart';
// import 'package:flutter_application_7/wedjet/acount/customacountiteam.dart';
// import 'package:flutter_application_7/wedjet/acount/customsectionheader.dart';

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality( // Sets text direction to LTR for English
//       textDirection: TextDirection.ltr,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("sidra", style: TextStyle(color: Colors.black)),
//           backgroundColor: Colors.white,
//           elevation: 0,
//         ),
//         body: ListView(
//           children: [
//            SectionHeader( title: 'Edit Profile',icon:Icons.person, showTrailing: true),
//             AccountItem(title:'My Orders'),
//             AccountItem(title:"My Addresses"),
//             AccountItem(title:"Favorites"),
         
//             SectionHeader(title:"Settings",icon: Icons.settings),
//            AccountItem(title:"Language"),
//             SectionHeader(title: "Help Center", icon:Icons.help_outline),
//            AccountItem(title:"Privacy Policy"),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor:AppColor.pink ,
//           child: Icon(Icons.chat),
//           onPressed: () {
//             // Help action
//           },
//         ),
    
//       ),
//     );
//   }

 
    

//   }


  







// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
// // import 'package:flutter_application_7/core/constant/color.dart';
// // import 'package:flutter_application_7/wedjet/acount/customacountiteam.dart';
// // import 'package:flutter_application_7/wedjet/acount/customsectionheader.dart';


// // class AccountScreen extends StatelessWidget {
// //   const AccountScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Directionality(
// //       // Sets text direction to LTR for English
// //       textDirection: TextDirection.ltr,
// //       // child: Scaffold(
// //       //   appBar: AppBar(
// //       //     centerTitle: true,
// //       //     title: const Text("sidra", style: TextStyle(color: Colors.black)),
// //       //     backgroundColor: Colors.white,
// //       //     elevation: 0,
// //       //   ),
// //       child: CustomScaffold(
// //         showAppBar: true,
// //         appBarTitle: 'Account',
// //         showNavBar: false,
// //         body: ListView(
// //           children: const [
// //             SectionHeader(
// //                 title: 'Edit Profile', icon: Icons.person, showTrailing: true),
// //             AccountItem(title: 'My Orders'),
// //             AccountItem(title: "My Addresses"),
// //             AccountItem(title: "Favorites"),
// //             SectionHeader(title: "Settings", icon: Icons.settings),
// //             AccountItem(title: "Language"),
// //             SectionHeader(title: "Help Center", icon: Icons.help_outline),
// //             AccountItem(title: "Privacy Policy"),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           backgroundColor: AppColor.pink,
// //           child: const Icon(Icons.chat),
// //           onPressed: () {
// //             // Help action
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

