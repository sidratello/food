import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/LoginController.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUpText.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomTextFormFieldSignUp.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/ForgetPassword_Screen.dart';
import 'package:flutter_application_7/Features/Category/presentation/views/category_screen.dart';

import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:flutter_application_7/helper/validation.dart';


import 'package:get/get.dart';

class login extends StatelessWidget {
  login({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); //Form is a wedjet to collect textfields in same place and the formkey the form wedjet need it   

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: ClipRRect(    //to make the edge  of image circulare
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                ),
                child: Image.asset(
                  AppImageAsset.onBoardingImagefoor2,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(  //determinate the place of text 
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomText(
                  text: "Sign in",
                  textAlign: TextAlign.left,
                  color: AppColor.pink,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Changa ExtraLight',
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: CustomTextField(
                      controller: controller.phone_Number,
                      hintText: 'phone number',
                      hintTextColor: Colors.black,
                      icon: Icon(
                        Icons.phone_android,
                        color: AppColor.pink,
                      ),
                      validator: validatePhoneNumber,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: CustomTextField(
                      controller: controller.password,
                      hintText: 'password',
                      icon: Icon(Icons.password, color: AppColor.pink),
                      hintTextColor: const Color.fromARGB(221, 6, 4, 4),
                      validator: validatePassword,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 0),
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.to(forgetpassword());
                      },
                      child: CustomSignUpText(
                        message: 'forget your password ?',
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),

    child: Button(

    onPressed: () {

    if (formKey.currentState!.validate()) { //the textfild should write in it so this call all the textfield and shure it isnt null 
    controller.login();

    } else {
    Get.snackbar("Error", "Please fix the errors above");
    }
    },
    title: "LOG IN", color: AppColor.pink,
    ),
    ),
    ],
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    CustomSignUpText(message: 'you dont have acount ?', color: Colors.black,),


    TextButton(
    onPressed: () {
    controller.gotoSignUp();
    },
    child: CustomSignUpText(message: ' sign up ', color: Colors.blueGrey,),
    ),
    ],
    ),
          ],
        ),
      ),
    );
  }
}
