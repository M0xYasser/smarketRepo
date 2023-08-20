import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  String url = 'https://api.deepai.org/api/text-generator';
  String apiKey = 'c47af66a-52b8-466e-9019-cbbcf4e3ff89';

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'api-key': apiKey,
  };

  Map<String, String> body = {
    'text':
        'marketing mail to buy a popular drink and the drink is pepsi company name is Smarket App',
  };

  http.post(Uri.parse(url), headers: headers, body: body).then((response) {
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    // String output = jsonData['output'];

    print(response.body);
  });
}
