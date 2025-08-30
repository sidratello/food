import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/Features/contact_us/presentation/view/contact_us_screen.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/show_adresess_screen.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/seting/presentation/view/seting_screen.dart';


import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColor.pink),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 35),
                child: Column(
                  children: [ Text("Sham Hpopaty", style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("0982486726", style: TextStyle(color: Colors.white, fontSize: 18),)
                  ],),
              ),

               CircleAvatar( radius: 40 ,backgroundImage: AssetImage("assets/images/save4.jpg"),),



              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.alarm_on_sharp,color:AppColor.pink),
            title: Text('My Orders'),
            onTap: () {
              //Get.to(() => MyProfileScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on, color:AppColor.pink),
            title: Text('My Locations'),
            onTap: () {
              Get.to(() => AddressListScreen(),);
            },
          ),
          ListTile(
            leading: Icon(Icons.book, color:AppColor.pink),
            title: Text('My Reservations'),
            onTap: () {
              Get.to(() => ShowReservationScreen());
            },),
          ListTile(
            leading: Icon(Icons.settings, color:AppColor.pink),
            title: Text('Settings'),
            onTap: () {
              Get.to(() => SettingScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support_rounded, color:AppColor.pink),
            title: Text('Contac US'),
            onTap: () {
              Get.to(() => ContactUsScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color:AppColor.pink),
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
