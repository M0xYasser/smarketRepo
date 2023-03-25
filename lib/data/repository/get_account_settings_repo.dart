import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_account_settings.dart';

Future<GetAccountSettings> fetchAcoountSettings(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return GetAccountSettings.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
