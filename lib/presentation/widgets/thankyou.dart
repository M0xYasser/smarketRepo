import 'package:flutter/material.dart';
import 'package:smarket_app/presentation/screens/homeScreen.dart';

import '../../core/constants/constant.dart';

Future thankYou(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext contex) {
      return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Container(
          height: 80,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Thank You 😊",
                  style: TextStyle(
                      fontFamily: "harabaraBold",
                      fontSize: 24,
                      color: Color(0xff666666)),
                ),
              ),
              Center(
                child: Container(
                  height: 36,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: myDarkGreen),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(contex);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    },
                    child: const Center(
                      child: Text(
                        "Back To Home",
                        style: TextStyle(
                            fontFamily: "harabaraBold",
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
