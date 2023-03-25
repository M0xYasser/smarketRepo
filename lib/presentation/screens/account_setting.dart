// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarket_app/presentation/widgets/customAppBar.dart';

class AccountSetting extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool password = true;

  AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        title: 'Account Settings',
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/person.jpg'),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 0,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              )),
                          child: SvgPicture.asset(
                            'assets/icons/add.svg',
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                width: 280,
                height: 48,
                child: TextFormField(
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        SvgPicture.asset("assets/icons/edit.svg"),
                        const SizedBox(
                          width: 26,
                        )
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color(0xff2C6976), // Text Color
                          ),
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              fontFamily: "harabaraBold",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        )
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                width: 280,
                height: 48,
                child: TextFormField(
                  style: const TextStyle(
                      fontFamily: "harabaraBold",
                      color: Color(0xff333333),
                      fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Language',
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
                        SvgPicture.asset("assets/icons/language.svg"),
                        const SizedBox(
                          width: 14,
                        )
                      ],
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: SvgPicture.asset("assets/icons/down.svg"),
                        ),
                        const SizedBox(
                          width: 0,
                        )
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 44, 105, 118)),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 190, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    200.0,
                  ),
                  color: const Color(0xff2C6976),
                ),
                child: MaterialButton(
                    onPressed: () {},
                    height: 50.0,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "harabaraBold",
                        fontSize: 20.0,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
