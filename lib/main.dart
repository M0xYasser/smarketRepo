import 'package:flutter/material.dart';

import 'core/routes/route.dart';

Future<void> main() async {
  runApp(const SmarketApp());
}

class SmarketApp extends StatelessWidget {
  const SmarketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splashScreen",
      routes: route,
    );
  }
}
