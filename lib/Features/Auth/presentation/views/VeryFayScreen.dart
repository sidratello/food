

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Controllers/VeryFayController2.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomButtomVeryFay.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomTextTitleVeryFay.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/NewPassword_Screen.dart';
import 'package:flutter_application_7/Features/Auth/presentation/views/login_screen.dart';




import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatelessWidget {
  final bool fromSignup;
 final int userId;
  const VerifyCodeScreen({super.key, required this.fromSignup, required this.userId});

  @override
  Widget build(BuildContext context) {
    VaryFicationControllerImp controller=Get.put(VaryFicationControllerImp());

    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
            Get.to(
 login(),);
        }, ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const CustomTitle(
                   
                   
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, message:  "Verification",
                    ),
                  
                  const SizedBox(height: 10),
                  const CustomTitle(
                  message:  "Enter the code we send  to your  \n phone number",
                    textAlign: TextAlign.center,
                   
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  
                  const SizedBox(height: 30),
            
                  // كود التحقق
                  PinCodeTextField(
                    appContext: context,
                    length: 5,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      activeColor: Colors.pink,
                      selectedColor: Colors.pinkAccent,
                      inactiveColor: Colors.pink.shade100,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
            
                  const SizedBox(height: 10),
            
                  // إعادة إرسال الكود
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive code? "),
                      GestureDetector(
                        onTap: () {
                          // تنفيذ إعادة الإرسال
                        },
                        child: const Text(
                          "Resend code",
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(height: 30),
            
                  // زر التحقق
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:CustomPinkButton(
              text: "Verify",
            onPressed: () {
              if (fromSignup) {
                // جاء من التسجيل
                Get.offAllNamed('/home'); // أو استخدم Navigator
              } else {
               controller.veryfay();
               // جاء من نسيت كلمة المرور
                Get.to(() => New_Password_Screen(userId: userId));
              }
            },
            
            
            
            ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
