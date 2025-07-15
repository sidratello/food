import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/categories/presentation/views/categories_screen.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';
import 'package:flutter_application_7/Features/show_reservation/presentation/views/show_reservation_screen.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 60, color: Colors.white),
                SizedBox(height: 10),
                Text("مرحباً بك 👋", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الرئيسية'),
            onTap: () {
              Get.to(() => CategoryScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('حجوزاتي'),
            onTap: () {
              Get.to(() => ShowReservationScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('إضافة حجز'),
            onTap: () {
              Get.to(() => ReservationScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('تسجيل الخروج'),
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
