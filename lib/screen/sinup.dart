
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';

import 'package:flutter_application_7/controller/VeryFicationFirst.dart';
import 'package:flutter_application_7/controller/signup_Controller.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

import 'package:flutter_application_7/helper/validation.dart';

import 'package:flutter_application_7/screen/varyfayscreen.dart';
import 'package:flutter_application_7/wedjet/login.dart';
import 'package:flutter_application_7/wedjet/sinup/CustomOtpDialog.dart';
import 'package:flutter_application_7/wedjet/sinup/CustomSignUpText.dart';
import 'package:flutter_application_7/wedjet/sinup/custombutomforsininandsinup.dart';

import 'package:flutter_application_7/wedjet/text.dart';

import 'package:http/http.dart'as http;


import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';




class Sinup extends StatelessWidget {
  
 Sinup({super.key});
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  @override
  Widget build(BuildContext context) {
    
    SignupControllerImp controller=Get.put(SignupControllerImp());
  
    return Scaffold(
  
body:  SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
          Container(
                  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 15,
        offset: Offset(0, 5), // اتجاه الظل للأسفل
      ),
    ],
    borderRadius: const BorderRadius.only(
      bottomRight: Radius.circular(90),
      bottomLeft: Radius.circular(90),
    ),
  ),
                child: ClipRRect(
                borderRadius: const BorderRadius.only(
                            
                  bottomRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90),
                ),
                child: Image.asset(
                  AppImageAsset.onBoardingImagefoor2,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                
                ),
                            ),
              ),
                    const SizedBox(height: 30),
                     Align(
                      alignment: Alignment.centerLeft,
                      
                       child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                         child: CustomText(text:"Sign up",
                         textAlign: TextAlign.left,
                                     color:AppColor.pink,
                                     fontSize: 40,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'Changa ExtraLight',
                                     ),
                       ),
                     ),
    
    Form(
      key:formKey ,
      child: Column(
       children:[
          Container(
             margin: EdgeInsets.all(20),
         
           
            child:CustomTextField(
 controller: controller.username,
              hintText: 'User name',hintTextColor: Colors.black, icon: Icon(Icons.person,color:AppColor.pink), 
            validator: validateUsername,),
            ),
        
      
      
        
        Container(
         margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),

       
        // child:CustomTextFormField(hintText: 'phone number', icon: Icon(Icons.email_outlined,color: AppColor.pink), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:emailcontroller,
        // keyboardType: TextInputType.phone,
        // ),
      
            child:CustomTextField(
      
              hintText: 'phone number', icon: Icon(Icons.phone_android,color: AppColor.pink), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:controller.phone_Number,
            validator: validatePhoneNumber,
      
        ),
        ),
      
        
        
        Container(
         margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        
       
        child:CustomTextField(hintText: 'Password', icon: Icon(Icons.password,color: AppColor.pink,), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:controller.password,
        validator: validatePassword,),
        ),
        
           Container(
         margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        
       
        child:CustomTextField(hintText: 'Location', icon: Icon(Icons.password,color: AppColor.pink,), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:controller.location,
        validator: validatePassword,),
        ),
        
    
          
    Padding(
  
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Button(
            
          onPressed: () {
              
                
                   if (formKey.currentState!.validate()) {
                         
                          controller.signup();// إذا كل شيء صحيح ينتقل للصفحة التالية
                        } else {
                          Get.snackbar("Error", "Please fix the errors above");
                        }
          },
          title: "sign up", color: AppColor.pink,
          ),
        ),
      
       ],
      ),
    ),
  
  Row(
    mainAxisAlignment: MainAxisAlignment.center,  
    children: [
  
      CustomSignUpText(message: 'you have acount ?', color: Colors.black,),
      TextButton(onPressed: () { 
         Get.to(login());
       },
      child: CustomSignUpText(message: ' sign in ', color:const Color.fromARGB(255, 3, 58, 32))),
    ],
  ),
  
  SizedBox(height: 12,),
  
  
    ],
    
    
    
  ),
),


    );
  }
}