

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Acount/preserntation/wedjet/SectionHeader.dart';
import 'package:flutter_application_7/Features/Acount/preserntation/wedjet/customAccountItem.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/show_adresess_screen.dart';
import 'package:flutter_application_7/Features/show_order/preserntation/views/show_order_screen.dart';
import 'package:flutter_application_7/core/constant/color.dart';

import 'package:get/get.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Sets text direction to LTR for English
      textDirection: TextDirection.ltr,
      // child: Scaffold(
      //   appBar: AppBar(
      //     centerTitle: true,
      //     title: const Text("sidra", style: TextStyle(color: Colors.black)),
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //   ),
      child: CustomScaffold(
        showAppBar: true,
        appBarTitle: 'Account',
        showNavBar: false,
        body: ListView(
          children:  [
            SectionHeader(
                title: 'Edit Profile', icon: Icons.person, showTrailing: true),
            AccountItem(title: 'My Orders',  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ShowOrdersScreen(), // 👈 الشاشة اللي بدك تعرضها
      ),
    );
  },
),
            AccountItem(title: "Favorites", onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressListScreen(), // 👈 الشاشة اللي بدك تعرضها
      ),
    );
  },),


              AccountItem(title: "adressess", onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressListScreen(), // 👈 الشاشة اللي بدك تعرضها
      ),
    );
  },),
            SectionHeader(title: "Settings", icon: Icons.settings),
            AccountItem(title: "Language", onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressListScreen(), // 👈 الشاشة اللي بدك تعرضها
      ),
    );
  },),
            SectionHeader(title: "Help Center", icon: Icons.help_outline),
            AccountItem(title: "Privacy Policy", onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressListScreen(), // 👈 الشاشة اللي بدك تعرضها
      ),
    );
  },),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.pink,
          child: const Icon(Icons.chat),
          onPressed: () {
            // Help action
          },
        ),
      ),
    );
  }
}

