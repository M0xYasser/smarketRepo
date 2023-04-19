import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/get_home.dart';

Future<GetHome> homeInfo(int id) async {
  final response = await http.get(Uri.parse(
      'https://smartcartapplication.azurewebsites.net/[AccountController]/GetUserData?id=${id.toString()}'));
  return GetHome.fromJson(jsonDecode(response.body));
}
