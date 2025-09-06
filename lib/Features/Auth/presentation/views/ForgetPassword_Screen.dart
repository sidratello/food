import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/ForgetPassword_Controller.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/UsertypeController.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUpText.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomTextFormFieldSignUp.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';

import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/helper/validation.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class forgetpassword extends StatelessWidget {
  const forgetpassword ({super.key});
  



       
          

  @override
  Widget build(BuildContext context) {
    ForgetPaswordControllerImp controller=Get.put(ForgetPaswordControllerImp());
    return  Scaffold(
appBar: AppBar(
title: CustomText(text:'Forget Pasword',
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
          child: CustomText(text:'Please enter your  Phone Number',
         
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'cario',
            )
          
         
        ),
      ),
    
  
  
          Container(
               margin: EdgeInsets.only(left: 20,right: 20,),
             
                 
                  child: CustomTextField(
                    controller:controller.phone_Number ,
                    hintText: 'phone number',hintTextColor: Colors.black, icon: Icon(Icons.phone_android,color: AppColor.pink, ),
                  validator:validatePhoneNumber ,),
                   ),

    //                         Container(
               
    // margin: EdgeInsets.only(left: 20, top: 0),
    // alignment: Alignment.centerLeft,
  //  child:  
     TextButton(onPressed: () {
       if (ChooseRoleControllerImp.role != null) {
       Get.to(() => login(type: ChooseRoleControllerImp.role!));
     } else {
       Get.snackbar('خطأ', 'الرجاء اختيار الدور أولاً');
     }
          },
          child: CustomSignUpText(message: 'go back to sign in ', color: Colors.blueGrey,),
         // ),
                            ),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                                     
  child:  Button(
            
       onPressed: () {

      
          controller.send();
          
       },
                      // ✅ هنا يتم فحص النموذج
                
          title: "Send", color: AppColor.pink,
          ),
  ),



    ],
  ),
),
    );
  }
}