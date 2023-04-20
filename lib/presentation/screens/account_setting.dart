// ignore_for_file: must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarket_app/core/constants/constant.dart';
import 'package:smarket_app/presentation/widgets/customAppBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../data/models/get_home.dart';
import '../../data/repository/get_home.dart';
import '../../data/repository/put_account_settings_repo.dart';
import 'email_otp.dart';

class AccountSetting extends StatefulWidget {
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  //AccountSettingController accountSettingController = Get.put(AccountSettingController());
  //AccountSettingController accountSettingController = Get.find();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var nameFocusNode = FocusNode();
  bool password = true;
  bool isEditing = true;
  bool isDisableBtn = true;
  Color buttonColor = Colors.grey;
  Color txtColor = Colors.grey;
  TextEditingController controller = TextEditingController();

  final namecontroller = TextEditingController(text: "Your initial value");
  String userName = "";
  String userEmail = "";
  String labelName = "";
  int userId = 0;

  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('id');
    GetHome data = await homeInfo(id!);

    setState(() {
      userName = data.userName!;
      userEmail = data.userEmail!;
      labelName = userName;
      userId = id;
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

                          /*image: accountSettingController
                                      .isProfilePicPathSet.value ==
                                  true
                              ? FileImage(file(accountSettingController
                                  .profilePicPath.value)) as ImageProvider*/
// TODO : USER IMG
                          image: AssetImage('assets/images/person.png'),
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
                          child: InkWell(
                            child: SvgPicture.asset(
                              'assets/icons/add.svg',
                            ),
                            onTap: () {
                              // TODO : SELECT PHOTO
                              takePhoto(ImageSource.gallery);

                              /*showModalBottomSheet(
                                  context: context,
                                  builder: (context) => bottomSheet(context));*/
                            },
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
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        showCursor: false,
                        onFieldSubmitted: (Value) {},
                        style: TextStyle(
                            fontFamily: "harabaraBold",
                            color: txtColor,
                            fontSize: 18),
                        decoration: InputDecoration(
                          labelText: labelName,
                          labelStyle: TextStyle(
                              fontFamily: "harabaraBold",
                              color: buttonColor,
                              fontSize: 18),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              SvgPicture.asset(
                                "assets/icons/solid_user.svg",
                                color: buttonColor,
                              ),
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
                              borderSide:
                                  BorderSide(width: 1.0, color: buttonColor),
                              borderRadius: BorderRadius.circular(50.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: buttonColor),
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
                    InkWell(
                        onTap: () {
                          setState(() {
                            isEditing = false;
                            txtColor = const Color(0xff333333);
                            buttonColor = myDarkGreen;
                            labelName = "Name";
                            nameController.text = userName;
                            isDisableBtn = false;
                          });
                        },
                        child: SvgPicture.asset("assets/icons/edit.svg")),
                    const SizedBox(
                      width: 48,
                    )
                  ],
                ),
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
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => EmailOtp(),
                        ));
                      },
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
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: (isDisableBtn) ? Colors.grey : myDarkGreen,
                ),
                child: MaterialButton(
                    onPressed: (isDisableBtn)
                        ? null
                        : () {
                            putName(userId, nameController.text);
                            setState(() {
                              isDisableBtn = true;
                              isEditing = true;
                              buttonColor = Colors.grey;
                              txtColor = Colors.grey;
                            });
                          },
                    height: 50.0,
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: (isDisableBtn) ? Colors.white54 : Colors.white,
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

  /*Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,R
      height: size.height * 0.3,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "harabaraBold",
                color: Color(0xff2C6976)),
          ),
          const SizedBox(
            height: 50,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.image,
                      color: Color(0xff2C6976),
                      size: 60,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Gallary",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "harabaraBold",
                          color: Color(0xff2C6976)),
                    )
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 100,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera,
                      color: Color(0xff2C6976),
                      size: 60,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "harabaraBold",
                          color: Color(0xff2C6976)),
                    )
                  ],
                ),
                onTap: () {
                  print("camera");
                  takePhoto(ImageSource.camera);
                },
              ),
            ],
          )
        ],
      ),
    );
  }*/

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await widget.imagePicker.pickImage(source: source, imageQuality: 100);

    widget.pickedFile = File(pickedImage!.path);
    // accountSettingController.setProfileImagePath(pickedFile!.path);

    Get.back();
    print(widget.pickedFile);
  }
}
