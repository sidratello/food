import 'package:flutter/material.dart';
import 'package:flutter_application_7/controller/onbording_controller.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/data/datasource/static/static.dart';
import 'package:flutter_application_7/data/model/onbordingmodel.dart';
import 'package:flutter_application_7/wedjet/onborging/buttom.dart';
import 'package:flutter_application_7/wedjet/onborging/dotcontrooler.dart';
import 'package:flutter_application_7/wedjet/onborging/pageview.dart';
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