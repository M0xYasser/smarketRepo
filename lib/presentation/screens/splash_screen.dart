import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(
          backgroundColor: Colors.white,
          logo:
              Image.asset('assets/images/SplashScreenLogo.png'), //SmartCartLogo
          logoWidth: 250,
          loadingText: const Text(
            'All Rights Reserved © 2023',
            style: TextStyle(
                color: Color(0xff5B5050), fontSize: 20, fontFamily: "harabara"),
          ),
          showLoader: false,
          navigator: const OnboardingScreen(),
          durationInSeconds: 2,
        ),
      ),
    );
  }
}
