import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/logout_controller.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/profilecontroller.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/setingscreen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/show_rating.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/CustomDrawerTile.dart';
import 'package:flutter_application_7/Features/Category/presentation/wedjets/customdialog.dart';
import 'package:flutter_application_7/Features/Reservation/presentation/views/show_reservation_screen.dart';
import 'package:flutter_application_7/Features/contact_us/presentation/view/contact_us_screen.dart';
import 'package:flutter_application_7/Features/external_order.dart/presentation/views/show_adresess_screen.dart';
import 'package:flutter_application_7/Features/mufaza/presentation/views/addtomuhfaza.dart';
import 'package:flutter_application_7/Features/reservation/presentation/views/reservation_screen.dart';

import 'package:flutter_application_7/Features/show_order/preserntation/views/show_order_screen.dart';


import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';



class CustomDrawer extends StatelessWidget {
    final ShowProfileController controller = Get.put(ShowProfileController());
    final logoutCtrl = Get.put(logoutController());
   CustomDrawer({super.key});

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
                child: Obx(() {
                    final name  = controller.profile.value?.name  ?? 'Guest';
                    final phone = controller.profile.value?.phone ?? '—';
                   return Column(
                  children: [ Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text(phone, style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],);}
              ),
              ),
               const CircleAvatar( radius: 40 ,backgroundImage: AssetImage("assets/images/save4.jpg"),),



              ],
            ),
          ),
                CustomDrawerTile(
            icon: Icons.alarm_on_sharp,
            title: "My Orders",
            iconColor: AppColor.pink,
            onTap: () => Get.to(() => ShowOrdersScreen()),
          ),
            CustomDrawerTile(
            icon: Icons.location_on,
            title: "My Locations",
            iconColor: AppColor.pink,
            onTap: () => Get.to(() => AddressListScreen()),
          ),
         CustomDrawerTile(
            icon: Icons.book,
            title: "My Reservations",
            iconColor: AppColor.pink,
            onTap: () => Get.to(() => ShowReservationScreen()),
          ),
          CustomDrawerTile(
            icon: Icons.settings,
            title: "Settings",
            iconColor: AppColor.pink,
            onTap: () => Get.to(() => SettingScreen()),
          ),
          CustomDrawerTile(
            icon: Icons.contact_support_rounded,
            title: "Contact Us",
            iconColor: AppColor.pink,
            onTap: () => Get.to(() => ContactUsScreen()),
          ),
                        CustomDrawerTile(
            icon: Icons.star_purple500,
            title: "rating",
            iconColor: AppColor.pink,
            onTap: () {
Get.to(RatingScreen());
            },
          ),
                                  CustomDrawerTile(
            icon: Icons.star_purple500,
            title: "mufaza",
            iconColor: AppColor.pink,
            onTap: () {
Get.to(WalletTopUpPage());
            },
          ),
    CustomDrawerTile(
            icon: Icons.logout,
            title: "Log out",
            iconColor: AppColor.pink,
            onTap: () {
              showCustomDialog(
      context: context,
      message: "هل أنت متأكد من تسجيل الخروج؟",
      onConfirm: () {
        print("تم تسجيل الخروج");
         logoutCtrl.submit();
         
      },
    );
            },
          ),

        ],
      ),
    );
  }
}
