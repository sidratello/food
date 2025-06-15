import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/NewPassword_Controller.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomTextFormFieldSignUp.dart';

import 'package:flutter_application_7/core/constant/color.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class New_Password_Screen extends StatelessWidget {
   final int userId;
  const New_Password_Screen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {

   RePasswordControllerImp controller=Get.put(RePasswordControllerImp( userId: userId));
    return  Scaffold(
appBar: AppBar(
title: CustomText(text:'New Pasword',
            color:AppColor.pink,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Changa ExtraLight',

),
),


body:Container(
  margin: EdgeInsets.only(top: 100,),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
  
  
       Padding(
         padding:EdgeInsets.symmetric(vertical: 15),
        child:
         Container(
               
    margin: EdgeInsets.only(left: 20, top: 0),
    alignment: Alignment.centerLeft,
          child: CustomText(text:'Enter New Pasword',
         
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'cario',
            )
          
         
        ),
      ),
    
  
  
          Container(
               margin: EdgeInsets.only(left: 20,right: 20,),
             
                 
                  child: CustomTextField(
                    controller: controller.password,
                    hintText: 'Password',hintTextColor: Colors.black, icon: Icon(Icons.password,color: AppColor.pink, ),
           ),
                   ),
         

    Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
          width: 700,
          height: 30,
          decoration: BoxDecoration(color:AppColor.pink, ),
                                     
  child:  Button(
            
       onPressed: () {
        controller.submit();
       },
                      // ✅ هنا يتم فحص النموذج
                
          title: "Sibmit", color: AppColor.pink,
          ),
  ),
],
),
),
    );
  }
}