import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarket_app/presentation/screens/create_account.dart';
import 'package:smarket_app/presentation/screens/reset_password.dart';
import '../widgets/background.dart';
import 'email_otp.dart';
import 'homeScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool password = true;

  @override
  Widget build(BuildContext context) {
    return BackGround(children: <Widget>[
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              "assets/gifs/login.gif", // GIF
              height: 265,
            ),
          ),
        ],
      ),
      Column(
        children: [
          const Text(
            "Signin",
            style: TextStyle(
                fontFamily: "harabaraBold",
                fontSize: 30,
                color: Color(0xff2C6976)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              width: 280,
              height: 48,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: emailController,
                style: const TextStyle(
                    fontFamily: "harabaraBold",
                    color: Color(0xff333333),
                    fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      fontFamily: "harabaraBold",
                      color: Color(0xff2C6976),
                      fontSize: 18),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      SvgPicture.asset("assets/icons/email.svg"),
                      const SizedBox(
                        width: 14,
                      )
                    ],
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 44, 105, 118)),
                      borderRadius: BorderRadius.circular(50.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 44, 105, 118)),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: 280,
              height: 48,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: password,
                style: const TextStyle(
                    fontFamily: "harabaraBold",
                    color: Color(0xff333333),
                    fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      fontFamily: "harabaraBold",
                      color: Color(0xff2C6976),
                      fontSize: 18),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 24,
                      ),
                      SvgPicture.asset("assets/icons/lock.svg"),
                      const SizedBox(
                        width: 14,
                      )
                    ],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      password ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xff2C6976),
                    ),
                    onPressed: () {
                      setState(() {
                        password = !password;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 44, 105, 118)),
                      borderRadius: BorderRadius.circular(50.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 44, 105, 118)),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forgotton your password?',
                  style: TextStyle(
                    fontFamily: "harabaraBold",
                    color: Color(0xff909090),
                    fontSize: 11,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => EmailOtp(),
                    ));
                  },
                  child: const Text(
                    ' Reset password',
                    style: TextStyle(
                      fontFamily: "harabaraBold",
                      color: Color(0xff5B759C),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff2c6976),
                ),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(
                        //   width: 5.0,
                        // ),
                        SvgPicture.asset(
                          'assets/icons/signin.svg',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          'Signin',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "harabaraBold",
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 08.0,
          ),
          const Text(
            '— OR —',
            style: TextStyle(
              fontFamily: "harabaraBold",
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/Facebook.svg',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/Google.svg',
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Do you still not have an account?',
            style: TextStyle(
              fontFamily: "harabaraBold",
              color: Color(0xff333333),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const CreateAccount(),
              ));
            },
            child: const Text(
              'Join Now',
              style: TextStyle(
                fontFamily: "harabaraBold",
                color: Color(0xff5B759C),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      )
      // CONTENT
    ]);
  }
}
