import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendEMail(
    {required String to_name,
    required String message,
    required String email}) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(url,
      body: json.encode({
        'service_id': "service_mygg3ox",
        'template_id': "template_a97xi6o",
        'user_id': "KnopeZ9OBkeCQjKRC",
        'accessToken': "THwfWnIDP9VWFBeIzx1bs",
        'template_params': {
          'to_name': to_name,
          'message': message,
          'email': email,
        }
      }),
      headers: {'Content-Type': 'application/json'});
  print(response.body);
}

void main() {
  sendEMail(
      to_name: "mohamed", message: "message", email: "midyass17@gmail.com");
}
