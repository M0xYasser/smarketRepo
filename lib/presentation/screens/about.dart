import 'package:flutter/material.dart';
import 'package:smarket_app/presentation/widgets/customAppBar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        title: 'About',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Smarket App",
              style: TextStyle(
                  fontFamily: "harabaraBold",
                  fontSize: 40,
                  color: Color(0xff2C6976)),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Version 00.00.00",
              style: TextStyle(
                  fontFamily: "harabaraBold",
                  fontSize: 24,
                  color: Color(0xff888888)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset(
                "assets/images/SplashScreenLogo.png", // GIF
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "All Rights Reserved © 2023",
              style: TextStyle(
                  fontFamily: "harabaraBold",
                  fontSize: 15,
                  color: Color(0xff888888)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
