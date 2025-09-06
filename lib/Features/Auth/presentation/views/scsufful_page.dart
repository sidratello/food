
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomBUttom.dart';
import 'package:flutter_application_7/Features/Auth/presentation/Wedjet/CustomSignUPText2.dart';
import 'package:flutter_application_7/core/constant/color.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';
import 'package:get/get.dart';

class PasswordChangedSuccessScreen extends StatefulWidget {
  const PasswordChangedSuccessScreen({super.key});

  @override
  State<PasswordChangedSuccessScreen> createState() =>
      _PasswordChangedSuccessScreenState();
}

class _PasswordChangedSuccessScreenState
    extends State<PasswordChangedSuccessScreen>
    with SingleTickerProviderStateMixin {
  // final _player = AudioPlayer();
  late final AnimationController _ac =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 600))
        ..forward();
  late final Animation<double> _scale =
      CurvedAnimation(parent: _ac, curve: Curves.easeOutBack);

  @override
  void initState() {
    super.initState();
    // _player.play(AssetSource('sounds/success.mp3')); // play once
  }

  @override
  void dispose() {
    _ac.dispose();
    // _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scale,
                  child: Container(
                    width: 140, height: 140,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE4EC), shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(AppImageAsset.marketrue)),
                  ),
                ),
                const SizedBox(height: 24),
                const CustomText(text:'successful!',
                fontFamily: 'Changa ExtraLight',
                   fontSize: 26, fontWeight: FontWeight.w800, color: Colors.pink),
                const SizedBox(height: 8),
                const Text(
                  'Your password has been updated.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: Button(

    onPressed: () {
Get.offAllNamed('/home');
    },
    title: "go to home page", color: AppColor.pink,
    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
