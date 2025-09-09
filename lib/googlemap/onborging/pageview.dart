import 'package:flutter/material.dart';
import 'package:flutter_application_7/controller/onbording_controller.dart';
import 'package:flutter_application_7/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomPageview extends GetView<OnBoringgControllerImp> {
  const CustomPageview({super.key});

  @override
  Widget build(BuildContext context) {

    return  PageView.builder(
controller: controller.pageController,
           onPageChanged:(val){
      controller.onpagechanged(val);
     },
                itemCount:onBoardingList.length ,
                itemBuilder:(context,i) =>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                      
                      child: Text(onBoardingList[i].title!,style: Theme.of(context).textTheme.displayLarge),
                      margin:EdgeInsets.all(20) ,),
                                 Image.asset(onBoardingList[i].image!),
                                 Text(onBoardingList[i].body!,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
                                 
                  ],
                  ),
                ),
                
              
             );
  }
}