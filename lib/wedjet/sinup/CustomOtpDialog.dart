import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomOtpDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final String imagePath;
  final String urlToLaunch;
  final Widget nextScreen; // الشاشة اللي تنتقل لها بعد الضغط

  const CustomOtpDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.imagePath,
    required this.urlToLaunch,
    required this.nextScreen,
  }) : super(key: key);

  Future<void> _openUrl(BuildContext context) async {
    if (await canLaunchUrl(Uri.parse(urlToLaunch))) {
      await launchUrl(Uri.parse(urlToLaunch), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا يمكن فتح الرابط')),
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
            Navigator.of(context).pop(); // إغلاق الديالوج
            Get.to(nextScreen); // الذهاب إلى الشاشة الجديدة
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
            onPressed: () => _openUrl(context),
          ),
     
      ],
    );
  }
}
