

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/CustomText_for_Emptyfavourite%20Screen.dart';
import 'package:flutter_application_7/Features/Product/presentation/wedjet/custom_scafould.dart';
import 'package:flutter_application_7/core/constant/imageassets.dart';

class EmptyFavoritesScreen extends StatefulWidget {
  const EmptyFavoritesScreen({super.key});

  @override
  State<EmptyFavoritesScreen> createState() => _EmptyFavoritesScreenState();
}

class _EmptyFavoritesScreenState extends State<EmptyFavoritesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   backgroundColor: Colors.white,
    //   body:
    CustomScaffold(
      showAppBar: true,
    appBarTitle: 'المفضلة',
      showNavBar:false,
      
      body:  
      FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
         
                Image.asset(
                 AppImageAsset.Favouriteimage ,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),

              CustomMessageText(text: 
                  'No favorites yet',
             
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                

                const SizedBox(height: 16),

       
                CustomMessageText(text:  'Press ❤️ to add an item to favourites',color:Colors.grey,   fontWeight: FontWeight.w400 ,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
