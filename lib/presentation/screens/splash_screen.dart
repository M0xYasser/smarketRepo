import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/presentation/screens/sign_in.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? isviewed;
  getIsViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoard');
    print(isviewed);
  }

  @override
  void initState() {
    getIsViewed();
    super.initState();
  }

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
          navigator: ((isviewed?.toInt()) == 1)
              ? const SignIn()
              : const OnboardingScreen(),
          durationInSeconds: 2,
        ),
      ),
    );
  }
}
