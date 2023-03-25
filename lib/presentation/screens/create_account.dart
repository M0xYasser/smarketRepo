import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/get_create_account.dart';
import '../../data/repository/post_account.dart';
import '../widgets/background.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

Future<void> saveUserCredentials(
    String? username, String? email, String? password, int? id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username!);
  await prefs.setString('email', email!);
  await prefs.setInt('id', id!);
  await prefs.setString('password', password!);
}

Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('username');
  return username!;
}

class _CreateAccount extends State<CreateAccount> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var usernameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool password = true;

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
                        GetCreateAccount data = await createAccount(
                          usernameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                        );
                        String? username = data.userName;
                        String? email = data.email;
                        String? password = data.password;
                        int? id = data.id;
                        print(username);
                        saveUserCredentials(username, email, password, id);
                      },
                      child: Row(
                        children: const [
                          // SvgPicture.asset(
                          //   'assets/icons/start.svg',
                          //   width: 15,
                          // ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
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
        ],
      )
      // CONTENT
    ]);
  }
}
