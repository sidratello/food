import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/homepage/preserntation/controller/onbordingcontroller.dart';

import 'package:flutter_application_7/core/constant/color.dart';
import 'package:get/get.dart';

class Custombordingbuttom extends GetView<OnBoringgControllerImp> {
  const Custombordingbuttom ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return       MaterialButton(onPressed: (){
controller.next();
              },
              color: AppColor.pink,
              height: 30,
              minWidth: 300,
                 shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text('GET Started',style: TextStyle(color: Colors.white),),
              );
  }
}