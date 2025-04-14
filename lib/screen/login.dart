import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:flutter_application_7/screen/home.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:flutter_application_7/screen/sinup.dart';
import 'package:flutter_application_7/wedjet/login.dart';
import 'package:flutter_application_7/wedjet/sinup/custombutomforsininandsinup.dart';
import 'package:flutter_application_7/wedjet/text.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
   // عنوان التطبيق
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp), // الأيقونة التي تريد إضافتها
          onPressed: () {
            // هنا يمكنك إضافة الكود الذي تريد تنفيذه عند الضغط على الأيقونة
            print('Menu icon pressed');
          },
        ),
      ),
body:  SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
       
  Padding(
    padding: EdgeInsets.all(30), // Adjust the padding value as needed
    child: Container(
      child: Text(
        "Sign in",
        style: TextStyle(
          color: AppColor.pink,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
  
  
       Container(
        margin: EdgeInsets.all(10),
        height: 200,
        width: 200,
          decoration: BoxDecoration(
      shape: BoxShape.circle,
          boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // لون الظل رمادي شفاف
          blurRadius: 10, // زيادة التمويه ليكون الظل ناعماً
          spreadRadius: 2, // توزيع الظل ليكون أكبر قليلاً
          offset: Offset(0, 4), // تحديد اتجاه الظل للأسفل قليلاً
        ),
      ], // ✅ يجعل الحاوية دائرية
      image: DecorationImage(
        image: AssetImage(AppImageAsset.onBoardingImagefoor),
        fit: BoxFit.cover, // ✅ لجعل الصورة تغطي الدائرة بالكامل
      ),
    ),
        ),
    
    Container(
       margin: EdgeInsets.all(20),
      width: 700,
     
      child:CustomTextField(hintText: 'phone number',hintTextColor: Colors.black, icon: Icon(Icons.mobile_screen_share_outlined,color: AppColor.pink,),),
      ),
    
    
  
      Container(
       margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      width: 700,
     
      child:CustomTextField(hintText: 'password', icon: Icon(Icons.password,color: AppColor.pink), hintTextColor: const Color.fromARGB(221, 6, 4, 4),),
      ),
    
  
  
  
    Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        width: 700,
        height: 30,
        decoration: BoxDecoration(color:AppColor.pink, ),
        
      child: Button(
        
      onPressed: () {
      
      
         Get.to(HomePage());
      
    
      },
      title: "LOG IN", color: AppColor.pink,
      ),
    ),
  
  Row(
    mainAxisAlignment: MainAxisAlignment.center,  
    children: [
  
      CustomSignUpText(message: 'you dont have acount ?', color: Colors.black,),
      TextButton(onPressed: () { 
        Get.to(Sinup());
      },
      child: CustomSignUpText(message: ' sign up ', color: Colors.blueGrey,)),
    ],
  ),
    ],
    
    
    
  ),
),


    );
  }
}
