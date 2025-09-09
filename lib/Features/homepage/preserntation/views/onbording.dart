import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/controller/onbordingcontroller.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/wedjet/custombuttom.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/wedjet/customdotcontrollerbording.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/wedjet/custompageview.dart';

import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/data/datasource/static/static.dart';


import 'package:get/get.dart';

class onbording extends StatelessWidget {
  const onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoringgControllerImp());
    return 
    Scaffold(
   

     body: SafeArea(
      
       child: Column(
         children: [
       
         
           Expanded(
             child:CustomPageview(),
           ),

Column(
children:const [
customdotcontrollerbording(),
            SizedBox(height: 20),
     Custombordingbuttom(),
               SizedBox(height: 90),
],
 ),
// لإعطاء مساحة أسفل الدوائر
          ],
        ),
      ),
    );
  }
}