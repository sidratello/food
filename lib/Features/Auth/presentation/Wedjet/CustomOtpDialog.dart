import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomOtpDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final String imagePath;
  final String urlToLaunch;
  final Widget nextScreen; 

  const CustomOtpDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.imagePath,
    required this.urlToLaunch,
    required this.nextScreen,
  }) : super(key: key);

  /// 🔹 دالة فتح واتساب
  Future<void> _launchWhatsapp(BuildContext context) async {
    // نحذف + والفراغات من الرقم
    final phone = urlToLaunch.replaceAll('+', '').replaceAll(' ', '');

    // نجهز الرابط باستخدام schema الخاص بـ WhatsApp
    final Uri whatsappUri = Uri.parse("whatsapp://send?phone=$phone&text=رمز التحقق");

    // نحاول نفتح الرابط
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
   
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("تأكد من أن تطبيق WhatsApp مثبت على الجهاز"),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: 20),
         
        ],
      ),
      actions: [
   TextButton(
          onPressed: () {
            Navigator.of(context).pop(); //to close the dialog screen and go tp nextscreen
            Get.to(nextScreen); 
          },
          child: Text(buttonText),
        ),
        SizedBox(width: 12,),
         IconButton(
            icon: Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            onPressed: () => _launchWhatsapp(context), 
          ),
     
      ],
    );
  }
}
