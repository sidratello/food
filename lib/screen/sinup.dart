
import 'package:flutter/material.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:flutter_application_7/wedjet/login.dart';
import 'package:flutter_application_7/wedjet/sinup/custombutomforsininandsinup.dart';
import 'package:flutter_application_7/wedjet/sinup/customtextformfield.dart';
import 'package:flutter_application_7/wedjet/text.dart';




import 'package:get/get.dart';




class Sinup extends StatelessWidget {
  
 Sinup({super.key});
 
   TextEditingController namecontroller = TextEditingController();
 TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();





 
   
  // Datalogin datalogin = Datalogin(); 
  //  @override
  // void initState() {
    
  //   datalogin = Datalogin();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
body:  SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 100,),
   Container(
       
     
      
     
          child: TextButton(
            onPressed: () {  },
            child: Text("Sign up",style: TextStyle(color:AppColor.pink,fontSize:30,fontWeight: FontWeight.bold),
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
     
      child:CustomTextField(hintText: 'User name',hintTextColor: Colors.black, icon: Icon(Icons.person,color:AppColor.pink), controller: namecontroller,),
      ),
    
    
  
      Container(
       margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      width: 700,
     
      // child:CustomTextFormField(hintText: 'phone number', icon: Icon(Icons.email_outlined,color: AppColor.pink), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:emailcontroller,
      // keyboardType: TextInputType.phone,
      // ),

          child:CustomTextField(hintText: 'phone number', icon: Icon(Icons.email_outlined,color: AppColor.pink), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:emailcontroller,
    
      ),
      ),
    
  
  
      Container(
       margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      width: 700,
     
      child:CustomTextField(hintText: 'Password', icon: Icon(Icons.password,color: AppColor.pink,), hintTextColor: const Color.fromARGB(221, 6, 4, 4),   controller:passwordcontroller,),
      ),
  
  
  
    Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 20),
        width: 700,
        height: 30,
        decoration: BoxDecoration(color:AppColor.pink, ),
        
      child: Button(
        
      onPressed: () {
    
      },
      title: "sign up", color: AppColor.pink,
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