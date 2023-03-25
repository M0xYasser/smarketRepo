import 'package:http/http.dart' as http;

import '../function/get_id.dart';

createAccount(String userName, String email, String password) async {
  http.post(Uri.parse(
      'https://d177-41-233-251-41.eu.ngrok.io/CreateAccount?userName=$userName&password=$password&email=$email'));
  //getid(email);
  // print(response.body);
  // print(response.statusCode);
  // if (response.statusCode == 200) {
  //   return Account.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to create Account.');
  // }
}

// class Account {
//   final String userName;
//   final String email;
//   final String password;

//   const Account(
//       {required this.userName, required this.email, required this.password});

//   factory Account.fromJson(Map<String, dynamic> json) {
//     return Account(
//       userName: json['userName'],
//       email: json['email'],
//       password: json['password'],
//     );
//   }
// }
