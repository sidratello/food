import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/change_name_screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/custom_listtile_for_seting.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/core/constant/color.dart';

import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
     
      showAppBar: true,
      appBarTitle: 'setting',
      showNavBar: false,
      showBackButton: true, 
      
  
      
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
              SettingItem(
              icon: Icons.person,
              title: "Edit Your Name",
              iconColor: AppColor.pink, // اختر اللون
              onTap: () {
                Get.to( ChangeNameScreen());
              },
            ),
             SettingItem(
              icon: Icons.sunny,
              title: "Edit Theme",
              iconColor: Colors.orange,
            ),
               SettingItem(
              icon: Icons.language,
              title: "Edit Language",
              iconColor: Colors.purple,
            ),
          ],
        ),
      ),
    
    );
  }
}
