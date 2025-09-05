import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/contact_us/presentation/view/contact_us_screen.dart';
import 'package:flutter_application_7/Features/settings/presentation/view/settings_screen.dart';
import 'package:get/get.dart';


class CustomDrawerDelivery extends StatelessWidget {
  const CustomDrawerDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color:Colors.yellow[600]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 35),
                  child: Column(
                    children: [ Text("Delivery_Man", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],),
                ),

                CircleAvatar( radius: 40 ,backgroundImage: AssetImage("assets/images/delivery.jpg"),),



              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.settings, color:Colors.yellow[600]),
            title: Text('Settings'),
            onTap: () {
              Get.to(() => SettingScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support_rounded, color:Colors.yellow[600]),
            title: Text('Contac US'),
            onTap: () {
              Get.to(() => ContactUsScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color:Colors.yellow[600]),
            title: Text('Log out'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text("هل أنت متأكد من تسجيل الخروج؟"),
                    actions: [
                      TextButton(
                        child: Text("إلغاء"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text("موافق"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          print("تم تسجيل الخروج");
                          // يمكنك هنا استخدام Get.offAll(() => LoginScreen());
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
