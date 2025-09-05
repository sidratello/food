import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/Features/Category/presentation/Controller/update_name_controller.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/helper/validation.dart';
import 'package:get/get.dart';

class ChangeNameScreen extends StatelessWidget {
  ChangeNameScreen({super.key});
  final UpdatenameController controller = Get.put(UpdatenameController());
 final GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: true,
      appBarTitle: 'change name',
      showNavBar: false,
      showBackButton: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'your name',
                    color: AppColor.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Changa ExtraLight',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.nameCtrl,
                    decoration: InputDecoration(
                      hintText: 'اكتب اسمك',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    textDirection: TextDirection.rtl,
                    validator: validateUsername,
               
                  ),
                 
                  Obx(() => Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Button(
                    
                          onPressed:(){
                                if (formKey.currentState!.validate()) { //the textfild should write in it so this call all the textfield and shure it isnt null 
              controller.submit();
            
                } else {
                Get.snackbar("Error", "Please fix the errors above");
                }
                },
                            
                          title: controller.isLoading.value ? "جارِ الحفظ..." : "save",
                          color: AppColor.pink,
            
                        ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
