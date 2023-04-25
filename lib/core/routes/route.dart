import 'package:flutter/material.dart';
import 'package:smarket_app/presentation/screens/addcard.dart';
import 'package:smarket_app/presentation/screens/reset_password.dart';
import 'package:smarket_app/presentation/screens/sign_in.dart';
import '../../presentation/screens/about.dart';
import '../../presentation/screens/account_setting.dart';
import '../../presentation/screens/invoices_screen.dart';
import '../../presentation/screens/paymentscreen.dart';
import '../../presentation/screens/create_account.dart';
import '../../presentation/screens/support.dart';
import '../../presentation/screens/homeScreen.dart';
import '../../presentation/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> route = {
  "home": (context) => const Home(),
  "splashScreen": (context) => const SplashScreen(),
  "support": (context) => const Support(),
  "Invoices": (context) => const InvoicesScreen(),
  "account": (context) => const CreateAccount(),
  "billing": (context) => const PaymentsScreen(),
  "setting": (context) => AccountSetting(),
  "about": (context) => const About(),
  "addcard": (context) => const AddCard(),
  "reset": (context) => ResetPassword(),
  "signin": (context) => const SignIn(),
};
