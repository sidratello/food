import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/datasource/static/static.dart';
import 'package:flutter_application_7/screen/login.dart';
import 'package:get/get.dart';

abstract class OnBoringgController extends GetxController {
  
next();
onpagechanged(int index);

  
}
class OnBoringgControllerImp extends OnBoringgController {
  late PageController pageController;
    int curentpage=0;
  @override
  next() {
    if(curentpage>onBoardingList.length-1){
      Get.offAllNamed("/login");
    }
    curentpage++;
  pageController.animateToPage(curentpage, duration: Duration(milliseconds:900 ), curve: Curves.easeInOut);
  }

  @override
  onpagechanged(int index) {
curentpage=index;
update();
  }
  @override
  void onInit() {
pageController=PageController();
    super.onInit();
  }
  
}