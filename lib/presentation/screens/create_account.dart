// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/get_info.dart';
import '../../data/repository/post_account.dart';
import '../widgets/background.dart';
import 'homeScreen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

Future<void> saveUserCredentials(int? id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setInt('id', id!);
}

class _CreateAccount extends State<CreateAccount> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var usernameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool password = true;
  isSignin() async {
    WidgetsFlutterBinding.ensureInitialized();
    int isSign = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('isSign', isSign);
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(close: true, closeScreen: "signin", children: <Widget>[
      Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              "assets/gifs/Signup.gif", // GIF
              height: 265,
            ),
          ),
        ],
      ),
      Column(
        children: [
          const Text(
            "Create Account",
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: 280,
              height: 48,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: usernameController,
                style: const TextStyle(
                    fontFamily: "harabaraBold",
                    color: Color(0xff333333),
                    fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Name',
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
                      SvgPicture.asset("assets/icons/solid_user.svg"),
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
                  labelText: 'password',
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
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 40,
                  width: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff2c6976),
                  ),
                  child: MaterialButton(
                      onPressed: () async {
                        GetInfo data = await createAccount(
                          usernameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                        );
                        int? id = data.id;
                        // print("-------------$id--------------");
                        // print("-------------${data.success}--------------");
                        saveUserCredentials(id);

                        if (data.success == "True") {
                          isSignin();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Oops, this process failed"),
                          ));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/start.svg',
                            width: 15,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            'Create',
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
          ),
        ],
      )
      // CONTENT
    ]);
  }
}
