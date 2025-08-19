import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/change_name/presentation/view/change_name_screen.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Edit Your Name" ),
              onTap: (){
                Get.to(ChangeNameScreen());
              },
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text("Edit Theme" ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Edit Language" ),
            ),
          ],
        ),
      ),
    );
  }
}
