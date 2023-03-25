// ignore_for_file: use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smarket_app/presentation/screens/reset_password.dart';

import '../../core/constants/constant.dart';
import '../widgets/background.dart';

class EmailOtp extends StatefulWidget {
  EmailOtp({super.key});
  final textEditingController = TextEditingController();

  @override
  State<EmailOtp> createState() => _EmailOTPState();
}

class _EmailOTPState extends State<EmailOtp> {
  EmailOTP myauth = EmailOTP();
  dynamic pin;
  sendOTP() async {
    myauth.setConfig(
        //TODO : User email
        appEmail: "midyass17@gmail.com",
        appName: "Smarket App",
        userEmail: "3c4b43179b@boxmail.lol",
        otpLength: 5,
        otpType: OTPType.digitsOnly);
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  @override
  void initState() {
    sendOTP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      close: true,
      // TODO : close screen
      closeScreen: "home",
      children: [
        Image.asset(
          "assets/gifs/OTP.gif",
          height: 220,
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          "Email Verification",
          style: TextStyle(
              color: myDarkGreen, fontFamily: "harabaraBold", fontSize: 30),
        ),
        const SizedBox(
          height: 36,
        ),
        const SizedBox(
          height: 20,
        ),
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          appContext: context,
          length: 5,
          obscureText: false,
          animationType: AnimationType.fade,
          cursorColor: myDarkGreen,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              activeColor: myDarkGreen,
              inactiveFillColor: Colors.white,
              inactiveColor: myDarkGreen,
              selectedFillColor: Colors.white,
              selectedColor: myDarkGreen),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: widget.textEditingController,
          onChanged: (value) {
            pin = value;
          },
        ),
        const SizedBox(
          height: 22,
        ),
        GestureDetector(
          onTap: () async {
            if (await myauth.verifyOTP(otp: pin) == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("OTP is verified"),
              ));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Invalid OTP"),
              ));
            }
          },
          child: Container(
              width: 205,
              padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
              decoration: BoxDecoration(
                  color: myDarkGreen, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Verify",
                  style: TextStyle(
                      fontFamily: "harabaraBold",
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        )
      ],
    );
  }
}
