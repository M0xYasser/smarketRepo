import 'dart:convert';
import 'package:http/http.dart' as http;

putName(int? id, String? name) async {
  String url =
      'https://smartcartapplication.azurewebsites.net/[AccountSettingsController]/UpdateName?userId=$id&newuserName=$name';
  http.Response response = await http.put(Uri.parse(url));
}

putPassword(int? id, String? password) async {
  String url =
      'https://smartcartapplication.azurewebsites.net/[AccountSettingsController]/UpdatePassword?userId=$id&newPassword=$password';
  http.Response response = await http.put(Uri.parse(url));
}
