// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/presentation/widgets/customAppBar.dart';

import 'dart:convert';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  // File _imageFile;
  // String _imageUrl;

  // Future<void> _uploadImage() async {
  // final picker = ImagePicker();
  // final pickedFile = await picker.getImage(source: ImageSource.gallery);
  // setState(() {
  // _imageFile = File(pickedFile.path);
  // });

  // final url = 'http://your-api-url.com/upload-image';
  // final bytes = await _imageFile.readAsBytes();
  // final base64Image = base64Encode(bytes);
  // final response = await http.post(
  // Uri.parse(url),
  // body: {
  // 'image': base64Image,
  // },
  // );

  // if (response.statusCode == 200) {
  // final jsonResponse = jsonDecode(response.body);
  // final newImageUrl = jsonResponse['image_url'];
  // setState(() {
  // _imageUrl = newImageUrl;
  // });

  // Update user's profile picture in database
  // final profileUpdateUrl = 'http://your-api-url.com/update-profile';
  // final profileUpdateResponse = await http.post(
  // Uri.parse(profileUpdateUrl),
  // body: {
  // 'user_id': '123', // replace with actual user ID
  // 'profile_picture_url': newImageUrl,
  // },
  // );
  // if (profileUpdateResponse.statusCode == 200) {
  // print('Profile picture updated successfully');
  // }
  // }
  // }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool password = true;
  bool isEditing = false;
  TextEditingController controller = TextEditingController();
  String userName = "";
  String userEmail = "";
  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    final String? email = prefs.getString('email');
    setState(() {
      userName = username!;
      userEmail = email!;
    });
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

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
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 48,
                    child: IgnorePointer(
                      ignoring: isEditing,
                      child: TextFormField(
                        enabled: !isEditing,
                        style: const TextStyle(
                            fontFamily: "harabaraBold",
                            color: Color(0xff333333),
                            fontSize: 18),
                        decoration: InputDecoration(
                          labelText: userName,
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
                          /*suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isEditing = false;
                                    });
                                  },
                                  child: SvgPicture.asset("assets/icons/edit.svg")),
                              const SizedBox(
                                width: 26,
                              )
                            ],
                          ),*/
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
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: SvgPicture.asset("assets/icons/edit.svg")),
                const SizedBox(
                  width: 26,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                height: 48,
                child: IgnorePointer(
                  ignoring: true,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: emailController,
                    style: const TextStyle(
                        fontFamily: "harabaraBold",
                        color: Colors.grey,
                        fontSize: 18),
                    decoration: InputDecoration(
                      labelText: userEmail,
                      labelStyle: const TextStyle(
                          fontFamily: "harabaraBold",
                          color: Colors.grey,
                          fontSize: 18),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          SvgPicture.asset(
                            "assets/icons/email.svg",
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 14,
                          )
                        ],
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 48,
                    child: IgnorePointer(
                      ignoring: true,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        obscureText: password,
                        style: const TextStyle(
                            fontFamily: "star",
                            color: Colors.grey,
                            fontSize: 18),
                        decoration: InputDecoration(
                          labelText: '***********',
                          labelStyle: const TextStyle(
                              fontFamily: "star",
                              color: Colors.grey,
                              fontSize: 18),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              SvgPicture.asset(
                                "assets/icons/lock.svg",
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 14,
                              )
                            ],
                          ),
                          // suffixIcon: Row(
                          // mainAxisSize: MainAxisSize.min,
                          // children: [
                          // const SizedBox(
                          // width: 24,
                          // ),
                          // TextButton(
                          // onPressed: () {},
                          // style: TextButton.styleFrom(
                          // foregroundColor:
                          // const Color(0xff2C6976), // Text Color
                          // ),
                          // child: const Text(
                          // 'Reset Password',
                          // style: TextStyle(
                          // fontFamily: "harabaraBold",
                          // ),
                          // ),
                          // ),
                          // const SizedBox(
                          // width: 14,
                          // )
                          // ],
                          // ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0, color: Colors.grey),
                              borderRadius: BorderRadius.circular(50.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0, color: Colors.grey),
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff2C6976), // Te
                      ),
                      child: const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontFamily: "harabaraBold",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 48,
                    )
                  ],
                ),
              ],
            ),
            /*Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
             child: SizedBox(
               width:  MediaQuery.of(context).size.width - 48,
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
           ),*/
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
